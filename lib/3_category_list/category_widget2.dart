import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udacity_sample/3_category_list/category2.dart';


final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(6.0);

class CategoryWidget2 extends StatelessWidget {
  final Category2 category;

  const CategoryWidget2({
    @required this.category
  }) : assert(category != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color,
          splashColor: Colors.blueGrey[100],
          customBorder: Border.all(color: Colors.blueGrey[200], width: 1.0, style: BorderStyle.solid),
          onTap: () {
            print('I Was Tapped');
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey[200], width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(6.0)
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                  child: Image.asset(
                    category.iconLocation,
                    height: 60.0,
                    width: 60.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: _rowHeight,
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal, color: Colors.black87),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}