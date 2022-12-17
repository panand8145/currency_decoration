import 'package:flutter/material.dart';

import 'currency_formatter.dart';
import 'currency_formatter/currency_symbol.dart';

class CurrencyDecoration extends StatelessWidget {
  /// Amount
  final double amount;

  /// Symbol of the currency. e.g. '€'
  final String symbol;

  /// Whether the symbol is shown before or after the money value, or if it is not shown at all.
  /// e.g. $ 125 ([SymbolPosition.left]) or 125 € ([SymbolPosition.right]).
  final SymbolSide? symbolSide;

  /// Thousand separator. e.g. 1,000,000 (`','`) or 1.000.000 (`'.'`). It can be set to any desired [String].
  /// It defaults to `','` for [SymbolSide.left] and to `'.'` for [SymbolSide.right].
  final String? thousandSeparator;

  /// Decimal separator. e.g. 9.10 (`'.'`) or 9,10 (`','`). It can be set to any desired [String].
  /// It defaults to `'.'` for [SymbolSide.left] and to `','` for [SymbolSide.right].
  final String? decimalSeparator;

  /// Character(s) between the number and the currency symbol. e.g. $ 9.10 (`' '`) or $9.10 (`''`).
  /// It defaults to a normal space (`' '`).
  final String? symbolSeparator;

  /// If [compact] is `true` the compact form will be used. e.g. `'$ 1.23K'` instead of `'$ 1,230'`.
  final bool? compact;

  const CurrencyDecoration({
    required this.amount,
    required this.symbol,
    this.symbolSide,
    this.thousandSeparator,
    this.decimalSeparator,
    this.symbolSeparator,
    this.compact,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrencyFormatterSettings euroSettings = CurrencyFormatterSettings(
        // formatter settings for euro
        symbol: symbol,
        symbolSide: symbolSide ?? SymbolSide.left,
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolSeparator: ' ');
    final String formatted = CurrencyFormatter.format(amount, euroSettings,
        compact: compact ?? false); // 1.910,93 €
    return Text(formatted);
  }
}
