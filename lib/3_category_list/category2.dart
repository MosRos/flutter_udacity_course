import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category2 {
  final String name;
  final ColorSwatch color;
  final String iconLocation;

  const Category2({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation
  }) : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        super();
}