import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamBuilder Counter',
      home: Scaffold(
        appBar: AppBar(title: const Text('StreamBuilder Counter')),
        body: const Center(child: CounterStreamBuilder()),
      ),
    );
  }
}

class CounterStreamBuilder extends StatefulWidget {
  const CounterStreamBuilder({super.key});

  @override
  State<CounterStreamBuilder> createState() => _CounterStreamBuilderState();
}

class _CounterStreamBuilderState extends State<CounterStreamBuilder> {
  int _counter = 0;
  late StreamController<int> _counterStreamController;

  @override
  void initState() {
    super.initState();
    _counterStreamController = StreamController<int>.broadcast();
    _startCounterStream();
  }

  // 创建一个每秒发出计数器更新的 Stream
  void _startCounterStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter++;
      _counterStreamController.sink.add(_counter); // 向 Stream 发送新的计数器值
    });
  }

  @override
  Widget build(BuildContext context) {
    print('StreamBuilder Widget rebuilt'); // 打印重建信息

    return StreamBuilder<int>(
      stream: _counterStreamController.stream, // 监听 Stream
      initialData: _counter, // 可选的初始数据
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return Text('Counter (StreamBuilder): ${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  void dispose() {
    print('CounterStreamBuilder Widget disposed'); // 打印 dispose 信息
    _counterStreamController.close(); // 关闭 StreamController
    super.dispose();
  }
}