
import 'package:flutter/material.dart';
import 'package:udacity_sample/model/unit.dart';


final _widgetHeight = 150.0;
final _formHeight = 60.0;

class InputCurrency extends StatefulWidget {

  static List<Unit> defaultUnits = <Unit>[
    new Unit(name: 'Dolar', conversion: 13550.0),
    new Unit(name: 'Ouro', conversion: 15700.0),
    new Unit(name: 'Pound', conversion: 17350.0),
    new Unit(name: 'Etherium', conversion: 130*13550.0),
    new Unit(name: 'Tether', conversion: 1*13550.0)
  ];

  final String name;
  final List<Unit> units;
  final Color color;

  const InputCurrency({
    @required this.name,
    @required this.units,
    @required this.color
}) : assert(name != null),
  assert(units != null),
  assert(color != null);

  @override
  State createState() {
    return InputCurrencyState();
  }
}

class InputCurrencyState extends State<InputCurrency> {

  static List<Unit> defaultUnits = <Unit>[
    const Unit(name: 'Dolar', conversion: 13550.0),
    const Unit(name: 'Ouro', conversion: 15700.0),
    const Unit(name: 'Pound', conversion: 17350.0),
    const Unit(name: 'Etherium', conversion: 130*13550.0),
    const Unit(name: 'Tether', conversion: 1*13550.0)
  ];

  double dolar = 0;
  double tooman = 0;
  Unit selectedUnit = defaultUnits[0];

  @override
  Widget build(BuildContext context) {
    return Material(

    );
  }

  Widget _createDropDown(String currentValue, ValueChanged<dynamic> onChange) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Center(
        child: DropdownButton<Unit>(
          hint: Text('Select Unit'),
          value: selectedUnit,
          onChanged: (Unit value){
            setState(() {
              selectedUnit = value;
            });
          },
          items: defaultUnits.map((Unit unitItem) {
            return DropdownMenuItem<Unit>(
              value: unitItem,
              child: Row(
                children: <Widget>[
                  Text(
                      unitItem.name,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}