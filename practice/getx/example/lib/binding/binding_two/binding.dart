import 'package:get/get.dart';

import 'logic.dart';

class BindingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindingTwoLogic());
  }
}
