import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:price_tracker/cubits/price_tracker_cubit.dart';
import 'package:price_tracker/cubits/price_tracker_state.dart';
import 'package:price_tracker/data/socket_service.dart';
import 'package:price_tracker/models/active_symbol.dart';
import 'package:price_tracker/utils/enums/enums.dart';

import 'mock_data.dart';

class MockSocketService extends Mock implements SocketService {}

void main() {
  late SocketService marketsService;
  late SocketService priceService;
  late PriceTrackerCubit priceTrackerCubit;

  setUp(() async {
    marketsService = MockSocketService();
    priceService = MockSocketService();
    priceTrackerCubit = PriceTrackerCubit(marketsService, priceService);
  });

  tearDown(() {
    priceTrackerCubit.close();
  });

  group('Cubit test', () {
    test(
      'Make sure that initial state is loading markets',
      () {
        expect(priceTrackerCubit.state,
            const PriceTrackerState(marketsRequestStatus: DataStatus.loading));
      },
    );

    blocTest<PriceTrackerCubit, PriceTrackerState>(
      '''Make sure connect method is called and when connection failed
          marketsRequestStatus = DataStatus.failure ''',
      setUp: () {
        when(() => marketsService.connect(any())).thenAnswer((_) => false);
        when(() => priceService.connect(any())).thenAnswer((_) => true);
      },
      build: () {
        return priceTrackerCubit;
      },
      act: (cubit) => cubit.connect(),
      verify: (c) => verify(() => c.connect()).called(1),
      expect: () => [
        const PriceTrackerState(marketsRequestStatus: DataStatus.failure),
      ],
    );

    blocTest<PriceTrackerCubit, PriceTrackerState>(
      'Make sure to emit new state with price and price-status, when receive new event',
      build: () {
        return priceTrackerCubit;
      },
      act: (cubit) => cubit.onGetPrice(json.encode(ticksList[0])),
      expect: () => [
        const PriceTrackerState(
            price: 196.4727,
            priceStatus: PriceStatus.unChanged,
            priceRequestStatus: DataStatus.success)
      ],
    );

    blocTest<PriceTrackerCubit, PriceTrackerState>(
      'Make sure to emit PriceStatus.decrease if new event price is decrease',
      build: () {
        return priceTrackerCubit;
      },
      seed: () => const PriceTrackerState(
        price: 196.4727,
      ),
      act: (cubit) => cubit.onGetPrice(json.encode(ticksList[1])),
      expect: () => [
        const PriceTrackerState(
            price: 196.4724,
            priceStatus: PriceStatus.decrease,
            priceRequestStatus: DataStatus.success)
      ],
    );

    blocTest<PriceTrackerCubit, PriceTrackerState>(
      'Make sure to emit PriceStatus.increase if new event price is increase',
      build: () {
        return priceTrackerCubit;
      },
      seed: () => const PriceTrackerState(
        price: 196.4724,
      ),
      act: (cubit) => cubit.onGetPrice(json.encode(ticksList[3])),
      expect: () => [
        const PriceTrackerState(
            price: 196.4728,
            priceStatus: PriceStatus.increase,
            priceRequestStatus: DataStatus.success)
      ],
    );

    blocTest<PriceTrackerCubit, PriceTrackerState>(
      '''Make sure to emit success market state and the market list when event recieved 
      and market services is closed''',
      build: () {
        return priceTrackerCubit;
      },
      act: (cubit) => cubit.onGetMarkets(json.encode(activSymbols)),
      expect: () => [
        PriceTrackerState(
          marketsRequestStatus: DataStatus.success,
          markets: markets,
        )
      ],
      verify: (c) => verify(() => marketsService.close()).called(1),
    );
  });

  blocTest<PriceTrackerCubit, PriceTrackerState>(
    'Make sure show loading, when select symbol',
    setUp: () => when(() => priceService.sendData(any())).thenAnswer((_) {}),
    build: () {
      return priceTrackerCubit;
    },
    act: (cubit) => cubit.onSelectSymbol(
      const ActieSymbol(
          displayName: 'AUD/JPY',
          market: 'forex',
          marketDisplayName: 'Forex',
          submarket: 'major_pairs',
          submarketDisplayName: 'Major Pairs',
          symbol: 'frxAUDJPY',
          symbolType: 'forex'),
    ),
    expect: () => [
      const PriceTrackerState(
          priceRequestStatus: DataStatus.loading,
          price: 0,
          priceStatus: PriceStatus.unChanged)
    ],
    verify: (bloc) => verify(() => priceService.sendData(any())).called(1),
  );
}
