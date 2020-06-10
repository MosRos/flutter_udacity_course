
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udacity_sample/4_navigation/widgets.dart';
import 'package:udacity_sample/model/category.dart';
import 'package:udacity_sample/model/unit.dart';


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

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final categories = <CategoryWidget>[];

    for(var i = 0; i < _categoryNames.length; i++) {
      categories.add(CategoryWidget(category: Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: _icons[i],
        units: _retrieveUnitList(_categoryNames[i])
      ),));
    }


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