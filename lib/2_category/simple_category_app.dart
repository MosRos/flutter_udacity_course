

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udacity_sample/2_category/category.dart';
import 'package:udacity_sample/2_category/category_widget.dart';

class SimpleCategoryApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Category Widget',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: CategoryWidget(
            category: new Category(name: 'Time', color: Colors.amber, iconLocation: Icons.alarm_on),
          ),
        ),
      ),
    );
  }
}