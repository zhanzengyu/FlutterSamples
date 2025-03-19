import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BindingTwoPage extends StatelessWidget {
  BindingTwoPage({Key? key}) : super(key: key);

  final BindingTwoLogic logic = Get.find<BindingTwoLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Binding Two')),
        body: const Center(
          child: Text(
            'Binding Two',
            style: TextStyle(fontSize: 16),
          ),
        ));
  }
}
