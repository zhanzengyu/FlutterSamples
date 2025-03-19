import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterEasyPage extends StatelessWidget {
  CounterEasyPage({Key? key}) : super(key: key);

  final CounterEasyLogic logic = Get.put(CounterEasyLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Easy')),
      body: Center(
        child: GetBuilder<CounterEasyLogic>(
          builder: (logic) {
            return Text(
              'Counter: ${logic.count}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logic.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
