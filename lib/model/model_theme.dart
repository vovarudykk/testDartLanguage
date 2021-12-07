import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData whiteTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData blackTheme = ThemeData(
  brightness: Brightness.dark,
);

class CheckTheme extends ChangeNotifier {
  late SharedPreferences prefs;
  late bool isBlack;

  bool get blackTheme => isBlack;

  CheckTheme() {
    isBlack = true;
    check();
  }

  setPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  holdPrefs() async {
    await setPrefs();
    prefs.setBool("theme", isBlack);
  }

  check() async {
    await setPrefs();
    isBlack = prefs.getBool("theme") ?? true;
    notifyListeners();
  }

  change() {
    isBlack = !isBlack;
    holdPrefs();
    notifyListeners();
  }
}
