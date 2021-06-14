import 'package:flutter/material.dart';

class Boxes {
  final id;
  String text;
  Color bg;
  bool enabled;

  Boxes({this.id, this.text = "", this.bg = Colors.grey, this.enabled = true});
}
