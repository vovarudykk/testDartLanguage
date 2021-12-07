// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/time_line.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBody createState() => _HomePageBody();
}

class _HomePageBody extends State<HomePageBody> {
  static const countPosts = 4;
  List<bool> isLikePressed = List.filled(countPosts, false);
  List<int> countsSeen = List.filled(countPosts, 0);

  void changeIsLikePressed(index) {
    setState(() {
      isLikePressed[index] = !isLikePressed[index];
    });
  }

  void changeCountSeen(index, count) {
    setState(() {
      countsSeen[index] = count;
    });
  }

  int getCountSeen(index) {
    return countsSeen[index];
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
            child: TimeLine(changeIsLikePressed, getIsLikePressed,
                getCountPosts, changeCountSeen, getCountSeen))
      ],
    );
  }
}
