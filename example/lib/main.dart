import 'package:currency_decoration/currency_decoration.dart';
import 'package:currency_decoration/currency_formatter/currency_symbol.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency decoration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const double amount_1 = 789456123.6778;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency decoration"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CurrencyDecoration(
              symbol: CurrencySymbol.INR,
              amount: amount_1,
              compact: false,
              symbolSide: SymbolSide.left,
              fractionDigits: 2,
              enforceDecimals: false,
              currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
              primaryTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              secondaryTextStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
              symbolTextStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
