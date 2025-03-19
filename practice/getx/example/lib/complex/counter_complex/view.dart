import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class CounterComplexPage extends StatelessWidget {
  CounterComplexPage({Key? key}) : super(key: key);

  final CounterComplexLogic logic = Get.put(CounterComplexLogic());
  final CounterComplexState state = Get.find<CounterComplexLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Complex')),
      body: Center(
        child: GetBuilder<CounterComplexLogic>(
          builder: (logic) {
            return Text(
              'Counter: ${state.count}',
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
