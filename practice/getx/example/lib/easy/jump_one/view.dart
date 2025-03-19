import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class JumpOnePage extends StatelessWidget {
  JumpOnePage({Key? key}) : super(key: key);

  final JumpOneLogic logic = Get.put(JumpOneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jump One')),
      body: Center(
        child: GetBuilder<JumpOneLogic>(
          builder: (logic) {
            return Text(
              'JumpOne click: ${logic.count}',
              style: const TextStyle(fontSize: 16),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logic.jumpTwo,
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
