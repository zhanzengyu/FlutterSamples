import 'package:flutter/material.dart';
import 'package:getx_example/architecture/easy.dart';
import 'package:getx_example/architecture/easy_builder.dart';
import 'package:getx_example/architecture_usage/easy_x_counter_logic.dart';

class EasyXCounterPage extends StatelessWidget {
  final EasyXCounterLogic logic = Easy.put(EasyXCounterLogic());

  EasyXCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyX-自定义EasyBuilder刷新机制'),
      ),
      body: Center(
        child: EasyBuilder<EasyXCounterLogic>(
          builder: (logic) {
            return Text(
              '${logic.count}',
              style: Theme.of(context).textTheme.headlineMedium,
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
