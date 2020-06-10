

import 'package:flutter/cupertino.dart';
import 'package:udacity_sample/model/unit.dart';

class Category {
  final String name;
  final ColorSwatch color;
  final String iconLocation;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units
  }) : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super();
}