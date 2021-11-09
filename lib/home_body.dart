// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/time_line.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBody createState() => _HomePageBody();
}

class _HomePageBody extends State<HomePageBody> {
  static const countPosts = 10;
  List<bool> isLikePressed = List.filled(countPosts, false);

  void changeIsLikePressed(index) {
    setState(() {
      isLikePressed[index] = !isLikePressed[index];
    });
  }

  bool getIsLikePressed(index) {
    return isLikePressed[index];
  }

  int getCountPosts() {
    return countPosts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
            child:
                TimeLine(changeIsLikePressed, getIsLikePressed, getCountPosts))
      ],
    );
  }
}
