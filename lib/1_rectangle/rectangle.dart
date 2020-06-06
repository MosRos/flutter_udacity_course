import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RectangleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home : MyHomePage(title: 'Flutter Demo Home Page',)
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World')),
        body: HelloRectangle(),
      ),
    );
  }
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        height: 300.0,
        width: 400.0,
        child: Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 40.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
