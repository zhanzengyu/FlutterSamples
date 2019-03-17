import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return MaterialApp(
        home: Scaffold(
          body: _buildWidget1(),
        ),
      );
    case 'route2':
      return MaterialApp(
        home: Scaffold(
          body: _buildWidget2(),
        ),
      );
    default:
      return MaterialApp(
        home: Scaffold(
          body: _buildDefaultWidget(),
        ),
      );
  }
}

Widget _buildWidget1() {
  //TODO
}

Widget _buildWidget2() {
  //TODO
}

Widget _buildDefaultWidget() {
  //TODO
}
