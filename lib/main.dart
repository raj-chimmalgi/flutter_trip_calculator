import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String name = '';
  final _currencies = ['USD', 'CAD', 'EUR'];
  String _currency = 'USD';
  TextEditingController distanceController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text("Trip Cost Calculator"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: distanceController,
                decoration: InputDecoration(
                  labelText: 'Distance',
                  hintText: 'e.g. 124',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              DropdownButton<String>(
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(value: value, child: new Text(value));
                }).toList(),
                value: _currency,
                onChanged: (String value) {
                  _onDropdownChange(value);
                },
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    setState(() {
                      result = distanceController.text;
                    });
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  )),
              Text(result),
            ],
          ),
        ));
  }

  _onDropdownChange(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
