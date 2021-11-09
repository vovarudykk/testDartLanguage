// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/home.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/model_color.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ModelColor(Colors.deepOrangeAccent), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryIconTheme: const IconThemeData(color: Colors.black),
          primaryTextTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme:
              const TextTheme(subtitle1: TextStyle(color: Colors.black))),
      home: HomePage(),
    );
  }
}
