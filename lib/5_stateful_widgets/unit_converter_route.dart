

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udacity_sample/model/unit.dart';

class StatefullConverterRoute extends StatefulWidget {

  final Color color;
  final List<Unit> units;

  const StatefullConverterRoute({
    @required this.color,
    @required this.units
  }) :
        assert(color != null),
        assert(units != null);

  @override
  _ConverterState createState() {
    return _ConverterState();
  }
}

class _ConverterState extends State<StatefullConverterRoute> {

  @override
  Widget build(BuildContext context) {
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
            ),
            Text(
              'Conversion',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead,
            )
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}