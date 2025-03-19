import 'package:get/get.dart';

class CounterRxLogic extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}
