import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomListTile extends StatelessWidget {

  final String name;
  final Icon icon;

  CustomListTile({
    this.name,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          highlightColor: Colors.white24,
          splashColor: Colors.white54,
          onTap: () {
            print('I Was Tapped');
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: icon,
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40.0, color: Colors.blueGrey),
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