import 'package:flutter/material.dart';

import 'currency_formatter.dart';
import 'currency_symbol.dart';

export 'currency_symbol.dart';

class CurrencyDecoration extends StatelessWidget {
  /// Amount. e.g. 52450.6998
  final double amount;

  /// Symbol of the currency. e.g. '€'
  final String symbol;

  /// If [enforceDecimals] is set to `true`, decimals will be shown even if it is an integer.
  /// e.g. `'$ 5.00'` instead of `'$ 5'`.
  final bool enforceDecimals;

  /// Whether the symbol is shown before or after the money value, or if it is not shown at all.
  /// e.g. $ 125 ([SymbolAlign.left]) or 125 € ([SymbolAlign.right]).
  final SymbolAlign? symbolAlign;

  /// Thousand separator. e.g. 1,000,000 (`','`) or 1.000.000 (`'.'`). It can be set to any desired [String].
  /// It defaults to `','` for [SymbolAlign.left] and to `'.'` for [SymbolAlign.right].
  final String? thousandSeparator;

  /// Decimal separator. e.g. 9.10 (`'.'`) or 9,10 (`','`). It can be set to any desired [String].
  /// It defaults to `'.'` for [SymbolAlign.left] and to `','` for [SymbolAlign.right].
  final String? decimalSeparator;

  /// Character(s) between the number and the currency symbol. e.g. $ 9.10 (`' '`) or $9.10 (`''`).
  /// It defaults to a normal space (`' '`).
  final String? symbolSeparator;

  /// If [compact] is `true` the compact form will be used. e.g. `'$ 1.23K'` instead of `'$ 1,230'`.
  final bool? compact;

  /// If [showThousandSeparator] is set to `false`, the thousand separator won't be shown.
  /// e.g. `'$ 1200'`instead of `'$ 1,200'`.
  final bool? showThousandSeparator;

  /// Examples:
  /// ```dart
  /// 1.toStringAsFixed(3);  // 1.000
  /// (4321.12345678).toStringAsFixed(3);  // 4321.123
  final int? fractionDigits;

  const CurrencyDecoration(
      {Key? key,
      required this.amount,
      required this.symbol,
      this.symbolAlign = SymbolAlign.left,
      this.thousandSeparator,
      this.decimalSeparator,
      this.symbolSeparator = '',
      this.enforceDecimals = false,
      this.showThousandSeparator = true,
      this.compact,
      this.primaryTextStyle,
      this.currencyValuePlaceStyle,
      this.secondaryTextStyle,
      this.symbolTextStyle,
      this.fractionalStyle,
      this.fractionDigits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrencyFormatterSettings currencyFormatterSettings =
        CurrencyFormatterSettings(
            symbol: symbol,
            thousandSeparator: thousandSeparator ?? ',',
            decimalSeparator: decimalSeparator ?? '.');
    final formatted = CurrencyFormatter.format(
        amount, currencyFormatterSettings,
        enforceDecimals: enforceDecimals,
        fractionDigits: fractionDigits ?? 2,
        currencyPlaceValueStyle: currencyValuePlaceStyle,
        showThousandSeparator: showThousandSeparator,
        compact: compact ?? false); // 1.910,93 €

    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    // Primary Text Style
    final TextStyle primeTextStyle = primaryTextStyle == null
        ? defaultTextStyle.style
        : defaultTextStyle.style.merge(primaryTextStyle);
    // Secondary Text Style
    final TextStyle secondTextStyle = primaryTextStyle == null
        ? defaultTextStyle.style
        : primaryTextStyle!.merge(secondaryTextStyle);
    // Symbol Style
    final TextStyle symTextStyle = symbolTextStyle == null
        ? symbolAlign == SymbolAlign.left
            ? primeTextStyle
            : secondTextStyle
        : primeTextStyle.merge(symbolTextStyle);
    return Text.rich(
      key: key,
      TextSpan(text: null, children: <InlineSpan>[
        if (symbolAlign == SymbolAlign.left && symbol.isNotEmpty)
          TextSpan(
            text: "$symbol$symbolSeparator",
            style: symTextStyle,
          ),
        TextSpan(
          text: formatted[0],
          style: primeTextStyle,
        ),
        if (formatted[1].isNotEmpty)
          TextSpan(
            text: "${decimalSeparator ?? '.'}${formatted[1]}",
            style: secondTextStyle,
          ),
        if (symbolAlign == SymbolAlign.right && symbol.isNotEmpty)
          TextSpan(
            text: "$symbolSeparator$symbol",
            style: symTextStyle,
          ),
      ]),
    );
  }

  /// Text style apply on whole units/value (e.g. 52470.596 then text style apply on 52470)
  final TextStyle? primaryTextStyle;

  /// Whole units/value comma style
  final CurrencyValuePlaceStyle? currencyValuePlaceStyle;

  /// Text style apply on fractional part (e.g. 52470.596 then text style apply on 596)
  final TextStyle? secondaryTextStyle;

  /// Text style apply on Currency Symbol
  final TextStyle? symbolTextStyle;

  /// Style on fractional part/value
  final FractionalStyle? fractionalStyle;
}
