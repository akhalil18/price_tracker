import 'package:equatable/equatable.dart';
import 'package:price_tracker/models/active_symbol.dart';

import '../utils/enums/enums.dart';

extension DataStatusEx on DataStatus {
  bool get isInitial => this == DataStatus.initial;
  bool get isLoading => this == DataStatus.loading;
  bool get isSuccess => this == DataStatus.success;
  bool get isFailure => this == DataStatus.failure;
}

class PriceTrackerState extends Equatable {
  final DataStatus marketsRequestStatus;
  final DataStatus priceRequestStatus;
  final List<String> markets;
  final List<ActieSymbol> symbols;
  final double? price;
  final PriceStatus priceStatus;
  final bool loadingSymbols;
  final String? selectedMarket;
  final ActieSymbol? selectedSymbol;

  const PriceTrackerState({
    this.marketsRequestStatus = DataStatus.loading,
    this.priceRequestStatus = DataStatus.initial,
    this.markets = const [],
    this.symbols = const [],
    this.price,
    this.priceStatus = PriceStatus.unChanged,
    this.loadingSymbols = false,
    this.selectedMarket,
    this.selectedSymbol,
  });

  PriceTrackerState copyWith({
    DataStatus? marketsRequestStatus,
    DataStatus? priceRequestStatus,
    List<String>? markets,
    List<ActieSymbol>? symbols,
    double? price,
    PriceStatus? priceStatus,
    bool? loadingSymbols,
    String? selectedMarket,
    ActieSymbol? selectedSymbol,
  }) {
    return PriceTrackerState(
        marketsRequestStatus: marketsRequestStatus ?? this.marketsRequestStatus,
        priceRequestStatus: priceRequestStatus ?? this.priceRequestStatus,
        markets: markets ?? this.markets,
        symbols: symbols ?? this.symbols,
        price: price ?? this.price,
        priceStatus: priceStatus ?? this.priceStatus,
        loadingSymbols: loadingSymbols ?? this.loadingSymbols,
        selectedMarket: selectedMarket ?? this.selectedMarket,
        selectedSymbol: (loadingSymbols ?? false)
            ? null
            : selectedSymbol ?? this.selectedSymbol);
  }

  @override
  List<Object?> get props => [
        marketsRequestStatus,
        priceRequestStatus,
        markets,
        symbols,
        price,
        priceStatus,
        selectedMarket,
        selectedSymbol,
        loadingSymbols
      ];
}
