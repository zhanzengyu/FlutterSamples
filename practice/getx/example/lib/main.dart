import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/counter_easy/view.dart';
import 'package:getx_example/counter_rx/view.dart';

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
      home: CounterRxPage(),
    );
  }
}
