library currency_formatter;

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
  static String format(amount, CurrencyFormatterSettings settings,
      {bool compact = false,
      int decimal = 2,
      showThousandSeparator = true,
      enforceDecimals = false}) {
    amount = double.parse('$amount');
    late String number;
    String letter = '';

    if (compact) {
      for (int i = 0; i < _letters.length; i++) {
        if (amount.abs() >= _letters.keys.elementAt(i)) {
          letter = _letters.values.elementAt(i);
          amount /= _letters.keys.elementAt(i);
          break;
        }
      }
      number = amount.toStringAsPrecision(3);
      number = number.replaceAll('.', settings.decimalSeparator!);
    } else {
      number = amount.toStringAsFixed(decimal);
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
        print("OldNumber $oldNum");
        for (int i = 0; i < oldNum.length; i++) {
          print("* ${oldNum[oldNum.length - i - 1]} + $number");
          number = oldNum[oldNum.length - i - 1] + number;
          print("--------------- $number");
          if ((i + 1) % 3 == 0 &&
              i < oldNum.length - (oldNum.startsWith('-') ? 2 : 1)) {
            number = settings.thousandSeparator! + number;
          }
        }
      }
    }
    print(settings.symbol);
    print(settings.symbolSeparator);
    print(number);
    print(letter);
    switch (settings.symbolSide) {
      case SymbolSide.left:
        return '${settings.symbol}${settings.symbolSeparator}$number$letter';
      case SymbolSide.right:
        return '$number$letter${settings.symbolSeparator}${settings.symbol}';
      default:
        return '$number$letter';
    }
  }

  /// Parse a formatted string to a number.
  static num parse(String input, CurrencyFormatterSettings settings) {
    String txt = input
        .replaceFirst(settings.thousandSeparator ?? '', '')
        .replaceFirst(settings.decimalSeparator ?? '', '.')
        .replaceFirst(settings.symbol, '')
        .replaceFirst(settings.symbolSeparator, '')
        .trim();

    String _letter = '';
    for (String letter in _letters.values) {
      if (txt.endsWith(letter)) {
        txt = txt.replaceFirst(letter, '');
        _letter = letter;
        break;
      }
    }

    return num.parse(txt) *
        _letters.keys
            .firstWhere((e) => _letters[e] == _letter, orElse: () => 1);
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

  /// Character(s) between the number and the currency symbol. e.g. $ 9.10 (`' '`) or $9.10 (`''`).
  /// It defaults to a normal space (`' '`).
  String symbolSeparator;

  CurrencyFormatterSettings(
      {required this.symbol,
      this.symbolSide = SymbolSide.left,
      this.thousandSeparator,
      this.decimalSeparator,
      this.symbolSeparator = ' '}) {
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
          decimalSeparator: decimalSeparator ?? this.decimalSeparator,
          symbolSeparator: symbolSeparator ?? this.symbolSeparator);
}
