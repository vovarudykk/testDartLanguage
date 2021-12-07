// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/home.dart';
import 'package:lab2/saved_favorite.dart';
import 'package:lab2/search.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/model_color.dart';

import 'model/model_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ModelColor(Colors.deepOrangeAccent), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CheckTheme(),
        child:
            Consumer<CheckTheme>(builder: (context, CheckTheme theme, child) {
          return MaterialApp(
            title: 'Instagram',
            debugShowCheckedModeBanner: false,
            theme: theme.isBlack
                ? ThemeData(
                    brightness: Brightness.dark,
                  )
                : ThemeData(
                    brightness: Brightness.light,
                  ),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/savedfavorite': (context) => const SavedFavorite(),
              '/search': (context) => const SearchPage(),
            },
          );
        }));
  }
}
