import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterRxPage extends StatelessWidget {
  CounterRxPage({Key? key}) : super(key: key);

  final CounterRxLogic logic = Get.put(CounterRxLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Rx')),
      body: Center(
        child: Obx(() {
          return Text(
            'Counter: ${logic.count.value}',
            style: const TextStyle(fontSize: 24),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logic.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
