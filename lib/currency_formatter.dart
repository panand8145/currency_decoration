library currency_formatter;

import 'package:intl/intl.dart';

import 'currency_formatter/currency_symbol.dart';

abstract class CurrencyFormatter {
  static final Map<num, String> _letters = {
    1000000000000: 'T',
    1000000000: 'B',
    1000000: 'M',
    1000: 'K'
  };

  /// Format [amount] using the [settings] of a currency.
  ///
  /// If [compact] is `true` the compact form will be used. e.g. `'$ 1.23K'` instead of `'$ 1,230'`.
  ///
  /// [decimal] is the number of decimal places used when rounding.
  /// e.g. `'$ 45.5'` (1 decimal place), `'$ 45.52'` (2 decimal places).
  ///
  /// If [showThousandSeparator] is set to `false`, the thousand separator won't be shown.
  /// e.g. `'$ 1200'`instead of `'$ 1,200'`.
  ///
  /// If [enforceDecimals] is set to `true`, decimals will be shown even if it is an integer.
  /// e.g. `'$ 5.00'` instead of `'$ 5'`.
  ///
  /// Currency value place [currencyPlaceStyle] is style how currency look like
  /// e.g. style1:   i/p 1552470.596   o/p 1,552,470.596
  /// e.g. style2:   i/p 1552470.596   o/p 15,52,470.596
  ///
  static List<String> format(amount, CurrencyFormatterSettings settings,
      {bool compact = false,
      int fractionDigits = 2,
      showThousandSeparator = true,
      currencyPlaceValueStyle,
      enforceDecimals = false}) {
    amount = double.parse('$amount');
    late String numberUnit;
    String letter = '';
    String decimalUnit = '';

    if (compact) {
      for (int i = 0; i < _letters.length; i++) {
        if (amount.abs() >= _letters.keys.elementAt(i)) {
          letter = _letters.values.elementAt(i);
          amount /= _letters.keys.elementAt(i);
          break;
        }
      }
      numberUnit = amount.toStringAsPrecision(3);
      numberUnit = numberUnit.replaceAll('.', settings.decimalSeparator!);
    } else {
      numberUnit = "$amount";

      if (!showThousandSeparator) {
        settings.thousandSeparator = "";
      }

      if (currencyPlaceValueStyle == CurrencyValuePlaceStyle.style1) {
        //final f = NumberFormat("#,##,###,###.00");
        final f = NumberFormat(
            "#${settings.thousandSeparator!}##${settings.thousandSeparator!}###${settings.thousandSeparator!}###${settings.decimalSeparator!}${List.generate(fractionDigits, (index) => "0").join('')}");
        numberUnit = (f.format(amount)).split(".")[0];
        decimalUnit = (f.format(amount)).split(".")[1];
      } else if (currencyPlaceValueStyle == CurrencyValuePlaceStyle.style2) {
        //final f = NumberFormat("##,##,##,###.00");
        final f = NumberFormat(
            "##${settings.thousandSeparator!}##${settings.thousandSeparator!}##${settings.thousandSeparator!}###${settings.decimalSeparator!}${List.generate(fractionDigits, (index) => "0").join('')}");
        numberUnit = (f.format(amount)).split(".")[0];
        decimalUnit = (f.format(amount)).split(".")[1];
      }

      // -------
      // number = amount.toStringAsFixed(fractionDigits);
      /*number = amount.toStringAsFixed(fractionDigits);
      if (!enforceDecimals &&
          double.parse(number) == double.parse(number).round()) {
        number = double.parse(number).round().toString();
      }
      number = number.replaceAll('.', settings.decimalSeparator!);
      if (showThousandSeparator) {
        String oldNum = number.split(settings.decimalSeparator!)[0];
        number = number.contains(settings.decimalSeparator!)
            ? settings.decimalSeparator! +
                number.split(settings.decimalSeparator!)[1]
            : '';
        decimalValue = number.replaceAll('.', '');
        number = "";
        for (int i = 0; i < oldNum.length; i++) {
          number = oldNum[oldNum.length - i - 1] + number;
          if ((i + 1) % 3 == 0 &&
              i < oldNum.length - (oldNum.startsWith('-') ? 2 : 1)) {
            number = settings.thousandSeparator! + number;
          }
        }
      }*/
    }

    switch (settings.symbolSide) {
      case SymbolSide.left:
        return ['$numberUnit$letter', decimalUnit];
      case SymbolSide.right:
        return ['$numberUnit$letter', decimalUnit];
      default:
        return ['$numberUnit$letter', decimalUnit];
    }
  }

  /// Parse a formatted string to a number.
  static num parse(String input, CurrencyFormatterSettings settings) {
    String txt = input
        .replaceFirst(settings.thousandSeparator ?? '', '')
        .replaceFirst(settings.decimalSeparator ?? '', '.')
        .replaceFirst(settings.symbol, '')
        .trim();

    String letter = '';
    for (String letter in _letters.values) {
      if (txt.endsWith(letter)) {
        txt = txt.replaceFirst(letter, '');
        letter = letter;
        break;
      }
    }

    return num.parse(txt) *
        _letters.keys.firstWhere((e) => _letters[e] == letter, orElse: () => 1);
  }
}

/// This class contains the formatting settings for a currency.
class CurrencyFormatterSettings {
  /// Symbol of the currency. e.g. '€'
  String symbol;

  /// Whether the symbol is shown before or after the money value, or if it is not shown at all.
  /// e.g. $ 125 ([SymbolSide.left]) or 125 € ([SymbolSide.right]).
  SymbolSide symbolSide;

  /// Thousand separator. e.g. 1,000,000 (`','`) or 1.000.000 (`'.'`). It can be set to any desired [String].
  /// It defaults to `','` for [SymbolSide.left] and to `'.'` for [SymbolSide.right].
  String? thousandSeparator;

  /// Decimal separator. e.g. 9.10 (`'.'`) or 9,10 (`','`). It can be set to any desired [String].
  /// It defaults to `'.'` for [SymbolSide.left] and to `','` for [SymbolSide.right].
  String? decimalSeparator;

  CurrencyFormatterSettings(
      {required this.symbol,
      this.symbolSide = SymbolSide.left,
      this.thousandSeparator,
      this.decimalSeparator}) {
    thousandSeparator ??= symbolSide == SymbolSide.left ? ',' : '.';
    decimalSeparator ??= symbolSide == SymbolSide.left ? '.' : ',';
  }

  // Returns the same [CurrencyFormatterSettings] but with some changed parameters.
  CurrencyFormatterSettings copyWith({
    String? symbol,
    SymbolSide? symbolSide,
    String? thousandSeparator,
    String? decimalSeparator,
    String? symbolSeparator,
  }) =>
      CurrencyFormatterSettings(
          symbol: symbol ?? this.symbol,
          symbolSide: symbolSide ?? this.symbolSide,
          thousandSeparator: thousandSeparator ?? this.thousandSeparator,
          decimalSeparator: decimalSeparator ?? this.decimalSeparator);
}

// https://www.woolha.com/tutorials/dart-formatting-currency-with-numberformat
// print(NumberFormat.simpleCurrency(locale: 'en_IN', decimalDigits: 2).format(15000000)); // 123.456,000 €
