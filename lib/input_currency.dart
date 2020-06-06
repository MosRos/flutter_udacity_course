
import 'package:flutter/material.dart';
import 'package:udacity_sample/model/unit.dart';


final _widgetHeight = 150.0;
final _formHeight = 60.0;
final _padding = EdgeInsets.all(16.0);

class InputCurrency extends StatefulWidget {

  static List<Unit> defaultUnits = <Unit>[
    new Unit(name: 'Dolar', conversion: 13550.0),
    new Unit(name: 'Ouro', conversion: 15700.0),
    new Unit(name: 'Pound', conversion: 17350.0),
    new Unit(name: 'Etherium', conversion: 130*13550.0),
    new Unit(name: 'Tether', conversion: 1*13550.0)
  ];

  List<Unit> units = <Unit>[
    const Unit(name: 'Dolar', conversion: 13550.0),
    const Unit(name: 'Ouro', conversion: 15700.0),
    const Unit(name: 'Pound', conversion: 17350.0),
    const Unit(name: 'Etherium', conversion: 130*13550.0),
    const Unit(name: 'Tether', conversion: 1*13550.0),
    const Unit(name: 'Tooman', conversion: 1)
  ];

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
    const Unit(name: 'Tether', conversion: 1*13550.0),
    const Unit(name: 'Tooman', conversion: 1)
  ];

  double dolar = 0;
  double tooman = 0;
  Unit _fromValue;
  Unit _toValue;
  double _inputValue = 0.0;
  String _convertedValue = "0.0";
  Unit selectedUnit = defaultUnits[0];
  List<DropdownMenuItem> _unitMenuItems;
  List<Unit> units = defaultUnits;

  @override
  void initState() {
    super.initState();
    _createDropDownMenuItems(defaultUnits);
    _setDefaults();
  }

  @override
  Widget build(BuildContext context) {
    final input = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // This is the widget that accepts text input. In this case, it

          // accepts numbers and calls the onChanged property on update.

          // You can read more about it here: https://flutter.io/text-input

          TextField(
            style: Theme.of(context).textTheme.display1,

            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.display1,
              labelText: 'Input',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),

            // Since we only want numerical input, we use a number keyboard. There

            // are also other keyboards for dates, emails, phone numbers, etc.

            keyboardType: TextInputType.number,

            onChanged: _updateInputValue,
          ),

          _createDropDown(_fromValue.name, _updateFromConversion),
        ],
      ),
    );

    final arrows = RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.compare_arrows,
        size: 40.0,
      ),
    );

    final output = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputDecorator(
            child: Text(
              _convertedValue,
              style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
              labelText: 'Output',
              labelStyle: Theme.of(context).textTheme.display1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          _createDropDown(_toValue.name, _updateToConversion),
        ],
      ),
    );

    final converter = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        input,
        arrows,
        output,
      ],
    );

    return Padding(
      padding: _padding,
      child: converter,
    );
  }

  void _createDropDownMenuItems(List<Unit> items) {
    var newItems = List<DropdownMenuItem>();

    for(var unit in items) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Container(
          child: Text(
            unit.name,
            softWrap: true,
          ),
        ),
      ));
    }

    setState(() {
      _unitMenuItems = newItems;
    });
  }

  void _setDefaults() {
    setState(() {
      _fromValue = defaultUnits[0];
      _toValue = defaultUnits[5];
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      if(input == null || input.isEmpty) {
        _convertedValue = '';
      } else {

        try {
          final inputDouble = double.parse(input);
          _inputValue = inputDouble;

          _updateConversion();
        } on Exception catch(e) {
          print('Error $e');
        }

      }
    });
  }

  void _updateConversion() {
    setState(() {
      _convertedValue = _format(_inputValue * (_toValue.conversion/_fromValue.conversion));
    });
  }

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);

    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;

      while (outputNum[i] == '0') {
        i -= 1;
      }

      outputNum = outputNum.substring(0, i + 1);
    }

    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }

    return outputNum;
  }

  Unit _getUnit(String unitName) {
    return widget.units.firstWhere(
        (Unit unit) {
          return unit.name == unitName;
        },
      orElse: null,
    );
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromValue = _getUnit(unitName);
    });

    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toValue = _getUnit(unitName);
    });

    if (_inputValue != null) {
      _updateConversion();
    }
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