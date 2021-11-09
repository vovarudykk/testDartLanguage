import 'package:flutter/material.dart';

class ModelColor extends ChangeNotifier {
  Color color;
  ModelColor(this.color);

  Color get getColor => color;
  set setColor(Color value) => color = value;

  void changeColor(value) {
    if (color == Colors.deepOrangeAccent) {
      // ignore: avoid_print
      print("История прочитана");
      color = value;
    } else {
      color = Colors.deepOrangeAccent;
      // ignore: avoid_print
      print("История не прочитана");
    }
    notifyListeners();
  }
}
