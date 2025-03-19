import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BindingOnePage extends StatelessWidget {
  BindingOnePage({Key? key}) : super(key: key);

  final BindingOneLogic logic = Get.find<BindingOneLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Binding One')),
        body: const Center(
          child: Text(
            'Binding One',
            style: TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: logic.jump,
          child: const Icon(Icons.arrow_forward),
        ));
  }
}
