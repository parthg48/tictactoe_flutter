import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.teal),
      home: new HomePage(),
    );
  }
}
