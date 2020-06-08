

import 'package:flutter/material.dart';
import 'package:udacity_sample/2_category/category.dart';
import 'package:udacity_sample/2_category/category_widget.dart';
import 'package:udacity_sample/3_category_list/category2.dart';
import 'package:udacity_sample/3_category_list/category_widget2.dart';


final _backgroundColor = Colors.green[100];

class StaticListApp extends StatelessWidget {

  const StaticListApp();

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

  static const _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
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

  @override
  Widget build(BuildContext context) {

    final categories = <CategoryWidget2>[];

    for(var i = 0; i < _categoryNames.length; i++) {
      categories.add(new CategoryWidget2(category: new Category2(name: _categoryNames[i], color: _baseColors[i], iconLocation: _icons[i])));
    }

//    final _appbar = AppBar(
//      elevation: 0.0,
//      title: Text(
//        'Unit Converter',
//        style: TextStyle(
//          color: Colors.black,
//          fontSize: 30.0,
//        ),
//      ),
//      centerTitle: true,
//      backgroundColor: _backgroundColor,
//    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Category Widget',
      home: Scaffold(
        appBar: _appBar(),
        body: Container(
          color: _backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _listView(categories),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        'Units',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );
  }

  Widget _listView(List<Widget> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => categories[index]
    );

  }

}