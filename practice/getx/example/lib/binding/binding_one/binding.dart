import 'package:get/get.dart';

import 'logic.dart';

class BindingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindingOneLogic());
  }
}
