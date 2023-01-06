import 'package:currency_decoration/currency_decoration.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              example_1(context),
              const SizedBox(
                height: 70.0,
              ),
              const CurrencyDecoration(
                symbol: CurrencySymbol.USD,
                amount: 134000,
                compact: true,
                symbolSide: SymbolSide.left,
                fractionDigits: 2,
                enforceDecimals: false,
                currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
                primaryTextStyle: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CurrencyDecoration(
                    symbol: CurrencySymbol.USD,
                    amount: 746722,
                    enforceDecimals: false,
                    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
                    fractionalStyle: FractionalStyle.cross,
                    primaryTextStyle: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CurrencyDecoration(
                    symbol: "Rs.",
                    amount: 79.99,
                    symbolSide: SymbolSide.left,
                    fractionDigits: 2,
                    enforceDecimals: false,
                    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
                    primaryTextStyle: TextStyle(
                        color: Colors.lime,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CurrencyDecoration(
                    symbol: CurrencySymbol.USD,
                    amount: 99.09,
                    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style1,
                    fractionalStyle: FractionalStyle.cross,
                    primaryTextStyle: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                    secondaryTextStyle: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CurrencyDecoration(
                    symbol: CurrencySymbol.CNY,
                    amount: 746722,
                    symbolSide: SymbolSide.left,
                    fractionDigits: 0,
                    enforceDecimals: false,
                    currencyValuePlaceStyle: CurrencyValuePlaceStyle.style2,
                    primaryTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 70.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox.fromSize(
                            child: Image.network(
                                "https://cdn.shopify.com/s/files/1/0666/2081/7620/products/CFSC4024BEIGE-1-_1_400x.jpg?v=1665729610",
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "FORT COLLINS",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Striped Slim Fit Shirt\n",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.white60),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CurrencyDecoration(
                          symbol: CurrencySymbol.INR,
                          amount: 699.99,
                          symbolSide: SymbolSide.left,
                          fractionDigits: 2,
                          enforceDecimals: false,
                          currencyValuePlaceStyle:
                              CurrencyValuePlaceStyle.style2,
                          primaryTextStyle: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                          secondaryTextStyle: TextStyle(
                              color: Colors.blueAccent.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox.fromSize(
                            child: Image.network(
                                "https://cdn.shopify.com/s/files/1/0666/2081/7620/products/CFDH3066BROWN_1_700x.jpg?v=1665480558",
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "DENNISLINGO PREMIUM",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Full Sleeves Slim Fit Classic Shirt",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.white60),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CurrencyDecoration(
                          symbol: CurrencySymbol.USD,
                          amount: 29.99,
                          symbolSide: SymbolSide.left,
                          fractionDigits: 2,
                          enforceDecimals: false,
                          currencyValuePlaceStyle:
                              CurrencyValuePlaceStyle.style2,
                          primaryTextStyle: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                          secondaryTextStyle: TextStyle(
                              color: Colors.blueAccent.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget example_1(BuildContext context) {
    const double amount_1 = 28945.6778;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Payable amount is",
                style: TextStyle(color: Colors.white54, fontSize: 11.0),
              ),
              const SizedBox(
                height: 6.0,
              ),
              CurrencyDecoration(
                symbol: CurrencySymbol.INR,
                amount: amount_1,
                symbolSide: SymbolSide.left,
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
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black45)),
              child: Text(
                "  Pay Now  ",
                style: TextStyle(
                  color: Colors.pink.shade600,
                ),
              )),
        ],
      ),
    );
  }
}
