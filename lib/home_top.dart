// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePageTop extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0.2,
      title:
          SizedBox(height: 46.0, child: Image.asset("resources/img/logo.png")),
      actions: const <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.chat, color: Colors.black))
      ],
    );
  }
}
