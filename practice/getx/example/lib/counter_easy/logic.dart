import 'package:get/get.dart';

class CounterEasyLogic extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update();
  }
}
