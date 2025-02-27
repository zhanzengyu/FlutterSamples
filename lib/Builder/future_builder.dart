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
      title: 'FutureBuilder Counter',
      home: Scaffold(
        appBar: AppBar(title: const Text('FutureBuilder Counter (Auto Update)')),
        body: const Center(child: CounterFutureBuilder()),
      ),
    );
  }
}

class CounterFutureBuilder extends StatefulWidget {
  const CounterFutureBuilder({super.key});

  @override
  State<CounterFutureBuilder> createState() => _CounterFutureBuilderState();
}

class _CounterFutureBuilderState extends State<CounterFutureBuilder> {
  int _counter = 0;
  Timer? _timer; // 用于周期性触发 rebuild

  @override
  void initState() {
    super.initState();
    // 使用 Timer 每秒触发 setState，强制 Widget 重建
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // setState 会触发 build 方法重新执行
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // 记得在 dispose 中取消 Timer
    print('CounterFutureBuilder Widget disposed');
    super.dispose();
  }

  // 模拟每秒更新计数器的 Future (每次 build 都重新创建)
  Future<int> _getCounterFuture() async {
    await Future.delayed(const Duration(seconds: 1)); // 模拟延迟
    _counter++;
    print('Future executed, counter: $_counter'); // 打印 Future 执行信息
    return _counter;
  }

  @override
  Widget build(BuildContext context) {
    print('FutureBuilder Widget rebuilt'); // 打印重建信息

    return FutureBuilder<int>(
      future: _getCounterFuture(), // 每次 build 都创建一个新的 Future
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return Text('Counter (FutureBuilder): ${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}