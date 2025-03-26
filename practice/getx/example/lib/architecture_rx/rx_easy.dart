import 'package:getx_example/architecture/easy_x_notifier.dart';

class RxEasy {
  EasyXNotifier easyXNotifier = EasyXNotifier();

  final Map<EasyXNotifier, String> _listenerMap = {};

  bool get canUpdate => _listenerMap.isNotEmpty;

  static RxEasy? proxy;

  void addListener(EasyXNotifier notifier) {
    if (_listenerMap.containsKey(notifier)) return;

    notifier.addListener(() {
      easyXNotifier.notify();
    });
    _listenerMap[notifier] = '';
  }
}