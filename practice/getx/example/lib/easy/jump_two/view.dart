import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../jump_one/logic.dart';
import 'logic.dart';

class JumpTwoPage extends StatelessWidget {
  JumpTwoPage({Key? key}) : super(key: key);

  final JumpTwoLogic twoLogic = Get.put(JumpTwoLogic());
  final oneLogic = Get.find<JumpOneLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jump Two')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<JumpTwoLogic>(
              builder: (twoLogic) {
                return Text(
                  'JumpTwo click: ${twoLogic.count}',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),

            GetBuilder<JumpTwoLogic>(
              builder: (twoLogic) {
                return Text(
                  '\nFrom JumpOne: ${twoLogic.msg}',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          oneLogic.increment();
          twoLogic.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
