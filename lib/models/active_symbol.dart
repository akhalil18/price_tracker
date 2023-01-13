import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ActieSymbol> actieSymbolsFromJson(String str) {
  final body = json.decode(str);

  return (body['active_symbols'] as List?)
          ?.map((e) => ActieSymbol.fromJson(e))
          .toList() ??
      [];
}

class ActieSymbol extends Equatable {
  final String displayName;
  final String market;
  final String marketDisplayName;
  final String submarket;
  final String submarketDisplayName;
  final String symbol;
  final String symbolType;

  const ActieSymbol({
    required this.displayName,
    required this.market,
    required this.marketDisplayName,
    required this.submarket,
    required this.submarketDisplayName,
    required this.symbol,
    required this.symbolType,
  });

  factory ActieSymbol.fromJson(Map<String, dynamic> json) => ActieSymbol(
        displayName: json['display_name'],
        market: json['market'],
        marketDisplayName: json['market_display_name'],
        submarket: json['submarket'],
        submarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type'],
      );

  @override
  List<Object?> get props => [
        displayName,
        market,
        marketDisplayName,
        submarket,
        submarketDisplayName,
        symbol,
        symbolType,
      ];
}
