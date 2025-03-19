import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/complex/counter_complex/view.dart';
import 'package:getx_example/easy/jump_two/view.dart';

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
      getPages: [
        GetPage(name: '/jump_two', page: () => JumpTwoPage()),
      ],
      home: CounterComplexPage(),
    );
  }
}
