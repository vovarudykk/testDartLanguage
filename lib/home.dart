// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/home_body.dart';
import 'package:lab2/time_line.dart';

class HomePage extends StatelessWidget {
  final topBar = AppBar(
    backgroundColor: Colors.white,
    centerTitle: false,
    elevation: 0.2,
    title: SizedBox(height: 46.0, child: Image.asset("resources/img/logo.png")),
    actions: const <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.chat, color: Colors.black))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: HomePageBody(),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
          ]),
    );
  }
}
