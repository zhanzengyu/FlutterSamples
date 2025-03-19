import 'package:get/get.dart';

import 'state.dart';

class CounterComplexLogic extends GetxController {
  final CounterComplexState state = CounterComplexState();

  void increment() {
    ++state.count;
    update();
  }
}
