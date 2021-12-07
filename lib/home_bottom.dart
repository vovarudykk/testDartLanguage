// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search', arguments: null);
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                    size: 30,
                  )),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.black,
                size: 30,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: ""),
        ]);
  }
}
