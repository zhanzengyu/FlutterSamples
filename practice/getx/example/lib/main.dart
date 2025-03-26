import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/binding/binding_one/view.dart';
import 'package:getx_example/config/route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.easyXEbsCounterPage,
      getPages: RouteConfig.getPages,
    );
  }
}
