import 'package:flutter/material.dart';

import 'currency_formatter.dart';
import 'currency_formatter/currency_symbol.dart';

class CurrencyDecoration extends StatelessWidget {
  /// Amount. e.g. 52450.6998
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
    this.primaryTextStyle,
    this.commaStyle,
    this.secondaryTextStyle,
    this.fractionalStyle,
    this.fractionalOpacity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrencyFormatterSettings currencyFormatterSettings =
        CurrencyFormatterSettings(
            // formatter settings for euro
            symbol: symbol,
            symbolSide: symbolSide ?? SymbolSide.left,
            thousandSeparator: ',',
            decimalSeparator: '.',
            symbolSeparator: ' ');
    final String formatted = CurrencyFormatter.format(
        amount, currencyFormatterSettings,
        compact: compact ?? false); // 1.910,93 €

    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle? effectiveTextStyle = primaryTextStyle;
    if (primaryTextStyle == null) {
      effectiveTextStyle = defaultTextStyle.style.merge(primaryTextStyle);
    }

    return Text(
      formatted,
    );
  }

  /// Text style apply on whole units/value (e.g. 52470.596 then text style apply on 52470)
  final TextStyle? primaryTextStyle;

  /// Whole units/value comma style
  final CommaStyle? commaStyle;

  /// Text style apply on fractional part (e.g. 52470.596 then text style apply on 596)
  final TextStyle? secondaryTextStyle;

  /// Style on fractional part/value
  final FractionalStyle? fractionalStyle;

  /// Style on fractional part/value
  final double? fractionalOpacity;
}
