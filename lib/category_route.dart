

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udacity_sample/category.dart';


final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {

  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _icons = <IconData>[
    Icons.cake,
    Icons.keyboard,
    Icons.book,
    Icons.book,
    Icons.book,
    Icons.book,
    Icons.book,
    Icons.book,
  ];

  @override
  Widget build(BuildContext context) {

    final listView = ListView.builder(
        itemCount: _categoryNames.length,
        itemBuilder: (context, index) {
          return Category(
            name: _categoryNames[index],
            color: _baseColors[index],
            iconLocation: _icons[index],
          );
        });
    final appBar = AppBar(
      backgroundColor: _backgroundColor,
      elevation: 0.0,
      title: Text(
        'Currency Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: _backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: listView,
      ),
    );
  }


}