<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## currency_decoration

A package to easily format money with custom UI. It support setting a custom currency symbol and format.

## Preview
https://github.com/panand8145/currency_decoration/blob/main/currency_decoration_1.jpg

## Installation
Add `currency_decoration` as a [dependency in your pubspec.yaml file](https://docs.flutter.dev/development/packages-and-plugins/using-packages).

```yaml  
dependencies:
    currency_decoration: ^0.0.1
```  

## Usage

```dart
// Example:
CurrencyDecoration(
    symbol: CurrencySymbol.USD,
    amount: 28945.6778,
    symbolSeparator: ' ',
    symbolAlign: SymbolAlign.left,
    fractionDigits: 2,
    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
    primaryTextStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 18.0),
    secondaryTextStyle: TextStyle(
        color: Colors.green.shade800,
        fontWeight: FontWeight.bold,
        fontSize: 14.0),
    symbolTextStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  )
```

## compact
```dart
CurrencyDecoration(
    symbol: CurrencySymbol.USD,
    amount: 134000,
    compact: true,
    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
    primaryTextStyle: TextStyle(
        color: Colors.deepOrangeAccent,
        fontWeight: FontWeight.bold,
        fontSize: 18.0),
  )
```
Output: `$134K`

## Supported default currency symbol

[Link](https://github.com/panand8145/currency_decoration/blob/main/lib/currency_symbol.dart)

## Money format style
### International style
```dart
CurrencyDecoration(
    symbol: CurrencySymbol.USD,
    amount: 134000,
    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style1,
  )
```
Output: `$134,000.00`

### Indian style
```dart
CurrencyDecoration(
    symbol: CurrencySymbol.INR,
    amount: 134000,
    symbolSeparator: '',
    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
  )
```
Output: `₹1,34,000.00`

## Currency Symbol Align

```dart
CurrencyDecoration(
    symbol: CurrencySymbol.USD,
    amount: 134000,
    fractionDigits: 0,
    symbolAlign: SymbolAlign.left,  // output: `$ 134,000`
 // symbolAlign: SymbolAlign.right, // output: `134,000 $`
    symbolSeparator: ' ',
    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style1,
  )
```


## Parameters
| Parameter | Description |
|---|---|
| `key` | Controls widget in the tree. |
| `amount`* | decimal/integer value |
| `symbol`* | currency symbol [Link](https://github.com/panand8145/currency_decoration/blob/main/lib/currency_symbol.dart), also accept any String value like `USD` or `INR` etc. |
| `symbolAlign` | Alignment of symbol default`SymbolAlign.left` |
| `thousandSeparator` | Thousand separator. e.g. 1,000,000 (`','`) or 1.000.000 (`'.'`). It can be set to any desired [String]. |
| `decimalSeparator` | Decimal separator. e.g. 9.10 (`'.'`) or 9,10 (`','`). It can be set to any desired [String]. |
| `symbolSeparator` | Character(s) between the amount and the currency symbol. e.g. $ 9.10 (`' '`) or $9.10 (`''`) |
| `enforceDecimals` | If [enforceDecimals] is set to `true`, decimals will be shown even if it is an integer. e.g. `'$ 5.00'` instead of `'$ 5'`. |
| `showThousandSeparator` | Thousand separator. e.g. 1,000,000 (`','`) or 1.000.000 (`'.'`). It can be set to any desired [String]. |
| `compact` | If [compact] is `true` the compact form will be used. e.g. `'$ 1.23K'` instead of `'$ 1,230'`. |
| `primaryTextStyle` | Text style apply on whole units/value (e.g. 52470.596 then text style apply on 52470). if a primary style does not define then use  `DefaultTextStyle.of(context)` as a default style |
| `secondaryTextStyle` | Text style apply on fractional part (e.g. 52470.596 then text style apply on 596). if a secondary style does not define then use `primaryTextStyle` as default |
| `symbolTextStyle` | Text style apply on currency Symbol. if symbol style does not define then use `primaryTextStyle` as default |
| `currencyValuePlaceStyle` | Whole units/value comma style |
| `fractionalStyle` | Style on fractional part/value |
| `fractionDigits` | fractional value |

Parameters marked with * are mandatory to give value.

## MIT License

```
Copyright (c) 2018 Anand Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
