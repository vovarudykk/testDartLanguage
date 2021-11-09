// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lab2/home_body.dart';
import 'package:lab2/home_bottom.dart';
import 'package:lab2/home_top.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageTop(),
      body: HomePageBody(),
      bottomNavigationBar: HomePageBottom(),
    );
  }
}
