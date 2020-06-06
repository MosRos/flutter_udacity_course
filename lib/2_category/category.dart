import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation
  }) : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        super();
}