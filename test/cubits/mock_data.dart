import 'package:price_tracker/models/active_symbol.dart';

final ticksList = [
  {
    "tick": {
      "id": "af5bf6fd-2c5b-9568-4c63-0eec1bb3c69b",
      "quote": 196.4727,
      "symbol": "R_50"
    }
  },
  {
    "tick": {
      "id": "af5bf6fd-2c5b-9568-4c63-0eec1bb3c69b",
      "quote": 196.4724,
      "symbol": "R_50"
    }
  },
  {
    "tick": {
      "id": "af5bf6fd-2c5b-9568-4c63-0eec1bb3c69b",
      "quote": 196.4724,
      "symbol": "R_50"
    }
  },
  {
    "tick": {
      "id": "af5bf6fd-2c5b-9568-4c63-0eec1bb3c69b",
      "quote": 196.4728,
      "symbol": "R_50"
    }
  }
];

final activSymbols = {
  "active_symbols": [
    {
      "allow_forward_starting": 0,
      "display_name": "AUD Basket",
      "display_order": 23,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "synthetic_index",
      "market_display_name": "Derived",
      "pip": 0.001,
      "subgroup": "baskets",
      "subgroup_display_name": "Baskets",
      "submarket": "forex_basket",
      "submarket_display_name": "Forex Basket",
      "symbol": "WLDAUD",
      "symbol_type": "forex_basket"
    },
    {
      "allow_forward_starting": 1,
      "display_name": "AUD/CHF",
      "display_order": 18,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "forex",
      "market_display_name": "Forex",
      "pip": 1e-05,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "minor_pairs",
      "submarket_display_name": "Minor Pairs",
      "symbol": "frxAUDCHF",
      "symbol_type": "forex"
    },
    {
      "allow_forward_starting": 1,
      "display_name": "AUD/JPY",
      "display_order": 1,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "forex",
      "market_display_name": "Forex",
      "pip": 0.001,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "major_pairs",
      "submarket_display_name": "Major Pairs",
      "symbol": "frxAUDJPY",
      "symbol_type": "forex"
    },
    {
      "allow_forward_starting": 1,
      "display_name": "AUD/NZD",
      "display_order": 17,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "forex",
      "market_display_name": "Forex",
      "pip": 1e-05,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "minor_pairs",
      "submarket_display_name": "Minor Pairs",
      "symbol": "frxAUDNZD",
      "symbol_type": "forex"
    },
    {
      "allow_forward_starting": 1,
      "display_name": "Australian Index",
      "display_order": 3,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "indices",
      "market_display_name": "Stock Indices",
      "pip": 0.01,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "asia_oceania_OTC",
      "submarket_display_name": "Asia/Oceania",
      "symbol": "OTC_AS51",
      "symbol_type": "stockindex"
    },
    {
      "allow_forward_starting": 0,
      "display_name": "BTC/USD",
      "display_order": 0,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "cryptocurrency",
      "market_display_name": "Cryptocurrencies",
      "pip": 0.001,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "non_stable_coin",
      "submarket_display_name": "Cryptocurrencies",
      "symbol": "cryBTCUSD",
      "symbol_type": "cryptocurrency"
    },
    {
      "allow_forward_starting": 1,
      "display_name": "Bear Market Index",
      "display_order": 8,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "synthetic_index",
      "market_display_name": "Derived",
      "pip": 0.0001,
      "subgroup": "synthetics",
      "subgroup_display_name": "Synthetics",
      "submarket": "random_daily",
      "submarket_display_name": "Daily Reset Indices",
      "symbol": "RDBEAR",
      "symbol_type": "stockindex"
    },
    {
      "allow_forward_starting": 0,
      "display_name": "Boom 300 Index",
      "display_order": 24,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "synthetic_index",
      "market_display_name": "Derived",
      "pip": 0.001,
      "subgroup": "synthetics",
      "subgroup_display_name": "Synthetics",
      "submarket": "crash_index",
      "submarket_display_name": "Crash/Boom Indices",
      "symbol": "BOOM300N",
      "symbol_type": ""
    },
    {
      "allow_forward_starting": 0,
      "display_name": "Boom 500 Index",
      "display_order": 18,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "synthetic_index",
      "market_display_name": "Derived",
      "pip": 0.001,
      "subgroup": "synthetics",
      "subgroup_display_name": "Synthetics",
      "submarket": "crash_index",
      "submarket_display_name": "Crash/Boom Indices",
      "symbol": "BOOM500",
      "symbol_type": ""
    },
    {
      "allow_forward_starting": 0,
      "display_name": "Boom 1000 Index",
      "display_order": 19,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "synthetic_index",
      "market_display_name": "Derived",
      "pip": 0.001,
      "subgroup": "synthetics",
      "subgroup_display_name": "Synthetics",
      "submarket": "crash_index",
      "submarket_display_name": "Crash/Boom Indices",
      "symbol": "BOOM1000",
      "symbol_type": ""
    },
    {
      "allow_forward_starting": 0,
      "display_name": "Crash 300 Index",
      "display_order": 22,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "synthetic_index",
      "market_display_name": "Derived",
      "pip": 0.001,
      "subgroup": "synthetics",
      "subgroup_display_name": "Synthetics",
      "submarket": "crash_index",
      "submarket_display_name": "Crash/Boom Indices",
      "symbol": "CRASH300N",
      "symbol_type": ""
    },
    {
      "allow_forward_starting": 1,
      "display_name": "Dutch Index",
      "display_order": 8,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "indices",
      "market_display_name": "Stock Indices",
      "pip": 0.01,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "europe_OTC",
      "submarket_display_name": "Europe",
      "symbol": "OTC_AEX",
      "symbol_type": "stockindex"
    },
    {
      "allow_forward_starting": 0,
      "display_name": "ETH/USD",
      "display_order": 1,
      "exchange_is_open": 1,
      "is_trading_suspended": 0,
      "market": "cryptocurrency",
      "market_display_name": "Cryptocurrencies",
      "pip": 1e-05,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "non_stable_coin",
      "submarket_display_name": "Cryptocurrencies",
      "symbol": "cryETHUSD",
      "symbol_type": "cryptocurrency"
    },
    {
      "allow_forward_starting": 1,
      "display_name": "Gold/USD",
      "display_order": 0,
      "exchange_is_open": 0,
      "is_trading_suspended": 0,
      "market": "commodities",
      "market_display_name": "Commodities",
      "pip": 0.01,
      "subgroup": "none",
      "subgroup_display_name": "None",
      "submarket": "metals",
      "submarket_display_name": "Metals",
      "symbol": "frxXAUUSD",
      "symbol_type": "commodities"
    }
  ],
};

final markets = [
  'synthetic_index',
  'forex',
  'indices',
  'cryptocurrency',
  'commodities',
];

final forexSymbols = [
  const ActieSymbol(
      displayName: 'AUD/CHF',
      market: 'forex',
      marketDisplayName: 'Forex',
      submarket: 'minor_pairs',
      submarketDisplayName: 'Minor Pairs',
      symbol: 'frxAUDCHF',
      symbolType: 'forex'),
  const ActieSymbol(
      displayName: 'AUD/JPY',
      market: 'forex',
      marketDisplayName: 'Forex',
      submarket: 'major_pairs',
      submarketDisplayName: 'Major Pairs',
      symbol: 'frxAUDJPY',
      symbolType: 'forex'),
  const ActieSymbol(
      displayName: 'AUD/NZD',
      market: 'forex',
      marketDisplayName: 'Forex',
      submarket: 'minor_pairs',
      submarketDisplayName: 'Minor Pairs',
      symbol: 'frxAUDNZD',
      symbolType: 'forex'),
];
