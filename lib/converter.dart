import 'package:flutter/material.dart';

class DollarConverter extends StatefulWidget {
  @override
  _DollarConverterState createState() => _DollarConverterState();
}

class _DollarConverterState extends State<DollarConverter> {
  final TextEditingController _coinAmountController = TextEditingController();
  final TextEditingController _dollarQuotationController =
      TextEditingController();
  String _result = "";

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFD3F3E4),
      appBar: AppBar(
        title: Text("CoinToDollar"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                child:
                    Image.asset("assets/dollar.png", width: 300, height: 300),
                alignment: Alignment.center),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                  controller: _coinAmountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'coin amount',
                    //dollar quotation
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelStyle: TextStyle(color: Colors.green),
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.green,
                    ),
                    fillColor: Colors.green,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                  controller: _dollarQuotationController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'dollar quotation',
                    //dollar quotation
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelStyle: TextStyle(color: Colors.green),
                    prefixIcon: Icon(
                      Icons.bar_chart,
                      color: Colors.green,
                    ),
                    fillColor: Colors.green,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  label: Text("clear"),
                  onPressed: _clearFields,
                  icon: Icon(Icons.clear),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                    label: Text("calculate"),
                    onPressed: _onCalculateClick,
                    icon: Icon(Icons.attach_money),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ))
              ],
            ),
            Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  void _onCalculateClick() {
    try {
      setState(() {
        var amount = double.parse(_coinAmountController.text);
        var quotation = double.parse(_dollarQuotationController.text);
        var result = (amount / quotation).toStringAsFixed(2);
        _result =
            'With ${amount.toStringAsFixed(2)} coins is possible to buy $result dollars at $quotation each';
      });
    } catch (e) {
      debugPrint(e);
    }
  }

  void _clearFields() {
    setState(() {
      _result = "";
      _coinAmountController.text = "";
      _dollarQuotationController.text = "";
    });
  }
}
