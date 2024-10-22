import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        primaryColor: Colors.teal,
        hintColor: Colors.tealAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final double exchangeRate = 17.65;
  final TextEditingController mdlController = TextEditingController();
  final TextEditingController usdController = TextEditingController();

  void _convertMDLtoUSD(String mdlValue) {
    if (mdlValue.isNotEmpty) {
      double mdl = double.tryParse(mdlValue) ?? 0;
      double usd = mdl / exchangeRate;
      usdController.text = usd.toStringAsFixed(2);
    } else {
      usdController.clear();
    }
  }

  void _convertUSDtoMDL(String usdValue) {
    if (usdValue.isNotEmpty) {
      double usd = double.tryParse(usdValue) ?? 0;
      double mdl = usd * exchangeRate;
      mdlController.text = mdl.toStringAsFixed(2);
    } else {
      mdlController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter', style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Convert MDL to USD and vice versa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _buildCurrencyField(
              controller: mdlController,
              label: 'MDL',
              flag: '🇲🇩',
              onChanged: _convertMDLtoUSD,
            ),
            SizedBox(height: 15),
            Center(
              child: Icon(
                Icons.swap_vert,
                size: 30,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 15),
            _buildCurrencyField(
              controller: usdController,
              label: 'USD',
              flag: '🇺🇸',
              onChanged: _convertUSDtoMDL,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (mdlController.text.isNotEmpty) {
                  _convertMDLtoUSD(mdlController.text);
                } else if (usdController.text.isNotEmpty) {
                  _convertUSDtoMDL(usdController.text);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Convert',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                '1 USD = $exchangeRate MDL',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyField({
    required TextEditingController controller,
    required String label,
    required String flag,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 10.0),
          child: Text(
            flag,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
