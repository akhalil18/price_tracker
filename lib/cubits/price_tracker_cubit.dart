import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/cubits/price_tracker_state.dart';
import 'package:price_tracker/models/active_symbol.dart';
import 'package:price_tracker/utils/routes/api_routes.dart';

import '../data/socket_service.dart';
import '../models/ticker.dart';
import '../utils/enums/enums.dart';

class PriceTrackerCubit extends Cubit<PriceTrackerState> {
  PriceTrackerCubit(this._marketsService, this._priceService)
      : super(const PriceTrackerState());

  final SocketService _marketsService;
  final SocketService _priceService;

  StreamSubscription? marketsSubscription;
  StreamSubscription? priceSubscription;

  var _activeSymbols = <ActieSymbol>[];

  var _symbols = <ActieSymbol>[];
  final _markets = <String>[];

  Ticker? _ticker;

  // Connect to activesymbols channel and price channel, then start listen to new events from them.
  void connect() {
    final isConnectedToMarketServer =
        _marketsService.connect(ApiRoutes.socketUrl);

    if (isConnectedToMarketServer) {
      marketsSubscription = _marketsService.dataStream?.listen(onGetMarkets);
      _marketsService
          .sendData({"active_symbols": "brief", "product_type": "basic"});
    }

    final isConnectedToPriceService =
        _priceService.connect(ApiRoutes.socketUrl);
    if (isConnectedToPriceService) {
      priceSubscription = _priceService.dataStream?.listen(onGetPrice);
    }

    if (!isConnectedToMarketServer || !isConnectedToPriceService) {
      emit(state.copyWith(marketsRequestStatus: DataStatus.failure));
    }
  }

  /// When active symbols event recieved, update market list and emit state with it
  void onGetMarkets(event) {
    if (event != null) {
      _activeSymbols = actieSymbolsFromJson(event);

      for (var s in _activeSymbols) {
        if (!_markets.contains(s.market)) {
          _markets.add(s.market);
        }
      }

      emit(
        state.copyWith(
          marketsRequestStatus: DataStatus.success,
          markets: _markets,
        ),
      );

      _marketsService.close();
    }
  }

  /// When new price recieved, emit state with the this price and also compare it with old one to update
  /// the new price color
  void onGetPrice(event) {
    if (event != null) {
      log(event);
      final body = json.decode(event);

      if (body['tick'] == null) {
        return;
      }

      _ticker = Ticker.fromJson(body['tick']);

      var priceStatus = PriceStatus.unChanged;

      if ((state.price ?? 0) > 0) {
        if (_ticker!.price > state.price!) {
          priceStatus = PriceStatus.increase;
        } else if (_ticker!.price < state.price!) {
          priceStatus = PriceStatus.decrease;
        }
      }

      emit(
        state.copyWith(
            price: _ticker?.price,
            priceStatus: priceStatus,
            priceRequestStatus: DataStatus.success),
      );
    }
  }

  /// When market changed, first update symbols list based on the selected market
  /// and then emit state with the new list
  void onMarketchanged(String? value) async {
    emit(state.copyWith(
        loadingSymbols: true, symbols: [], selectedSymbol: null));

    await Future.delayed(const Duration(milliseconds: 100));

    _symbols = _activeSymbols.where((m) => m.market == value).toList();

    emit(
      state.copyWith(
        selectedMarket: value,
        symbols: _symbols,
        loadingSymbols: false,
      ),
    );
  }

  // cancel the real-time stream of messages with a specific ID.
  void cancelStreamWithId() {
    if (_ticker != null) {
      _priceService.sendData({"forget": _ticker!.streamId});
    }
  }

  // When symbol changed, send new symbol to socket and show loading indicator
  void onSelectSymbol(ActieSymbol? actieSymbol) async {
    cancelStreamWithId();
    emit(state.copyWith(
        priceRequestStatus: DataStatus.loading,
        price: 0,
        priceStatus: PriceStatus.unChanged));
    await Future.delayed(const Duration(milliseconds: 200));

    _priceService.sendData({"ticks": actieSymbol!.symbol, "subscribe": 1});
  }

  // Cancel all stream subscription and close market service and price service
  @override
  Future<void> close() {
    marketsSubscription?.cancel();
    priceSubscription?.cancel();
    _priceService.close();
    return super.close();
  }
}
