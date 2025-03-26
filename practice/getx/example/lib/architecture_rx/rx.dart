import 'package:getx_example/architecture/easy_x_notifier.dart';
import 'package:getx_example/architecture_rx/rx_easy.dart';

class Rx<T> {
  EasyXNotifier subject = EasyXNotifier();
  late T _value;

  Rx(T initial) {
    _value = initial;
  }

  String get string => _value.toString();

  @override
  String toString() => _value.toString();

  bool firstRebuild = true;

  set value(T val) {
    if (_value == val && !firstRebuild) return;

    firstRebuild = false;
    _value = val;

    subject.notify();
  }

  T get value {
    RxEasy.proxy?.addListener(subject);
    return _value;
  }

}

class RxInt extends Rx<int> {
  RxInt(int initial) : super(initial);

  RxInt operator +(int other) {
    value += other;
    return this;
  }

  RxInt operator -(int other) {
    value -= other;
    return this;
  }
}

class RxDouble extends Rx<double> {
  RxDouble(double initial) : super(initial);

  RxDouble operator +(double other) {
    value += other;
    return this;
  }

  RxDouble operator -(double other) {
    value -= other;
    return this;
  }
}

class RxString extends Rx<String> {
  RxString(String initial) : super(initial);
}

class RxBool extends Rx<bool> {
  RxBool(bool initial) : super(initial);
}

/// 拓展函数
extension IntExtension on int {
  RxInt get ebs => RxInt(this);
}

extension DoubleExtension on double {
  RxDouble get ebs => RxDouble(this);
}

extension StringExtension on String {
  RxString get ebs => RxString(this);
}

extension BoolExtension on bool {
  RxBool get ebs => RxBool(this);
}



