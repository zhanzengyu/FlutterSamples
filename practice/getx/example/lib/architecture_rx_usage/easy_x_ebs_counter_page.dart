import 'package:flutter/material.dart';
import 'package:getx_example/architecture/easy.dart';
import 'package:getx_example/architecture_rx/ebx.dart';
import 'package:getx_example/architecture_rx_usage/easy_x_ebs_counter_logic.dart';

class EasyXEbsCounterPage extends StatelessWidget {
  final EasyXEbsCounterLogic logic = Easy.put(EasyXEbsCounterLogic());

  EasyXEbsCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyX-自定义Ebx刷新机制'),
      ),
      body: Center(
        child: Ebx((){
          return Text(
            '${logic.count.value}',
            style: Theme.of(context).textTheme.headlineMedium,
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