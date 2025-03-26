import 'package:flutter/cupertino.dart';

/// 自定义监听触发类
class EasyXNotifier {
  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void dispose() {
    _listeners.clear();
  }

  void notify() {
    for (var element in _listeners) {
      element();
    }
  }
}
