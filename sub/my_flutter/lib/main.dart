import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/battery_widget.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'battery':
      return MaterialApp(
        home: Scaffold(
          body: BatteryWidget(),
        ),
      );
    default:
      return MaterialApp(
        home: Scaffold(
          body: Container(),
        ),
      );
  }
}
