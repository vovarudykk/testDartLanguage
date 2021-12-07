// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/model/model_theme.dart';
import 'package:provider/provider.dart';

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
      actions: <Widget>[
        Container(
          child: Consumer<CheckTheme>(
            builder: (context, notifier, child) => IconButton(
              icon: const Icon(
                Icons.dark_mode,
                color: Colors.black,
              ),
              onPressed: () {
                notifier.change();
              },
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.chat, color: Colors.black)),
      ],
    );
  }
}
