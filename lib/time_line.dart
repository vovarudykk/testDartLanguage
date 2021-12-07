// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/stories.dart';
import 'stories.dart';
import 'posts.dart';

// ignore: must_be_immutable
class TimeLine extends StatelessWidget {
  final void Function(int index) changeIsLikePressed;
  final bool Function(int index) getIsLikePressed;
  final int Function() getCountPosts;

  final void Function(int index, int count) changeCountSeen;
  final int Function(int index) getCountSeen;

  const TimeLine(
    this.changeIsLikePressed,
    this.getIsLikePressed,
    this.getCountPosts,
    this.changeCountSeen,
    this.getCountSeen,
  );

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: getCountPosts(),
      itemBuilder: (context, index) => index == 0
          ? SizedBox(
              child: Stories(),
              height: deviceSize.height * 0.14,
            )
          : Posts(changeIsLikePressed, getIsLikePressed, getCountPosts, index,
              getCountSeen, changeCountSeen),
    );
  }
}
