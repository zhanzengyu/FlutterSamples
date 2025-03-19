import 'package:get/get.dart';

class JumpOneLogic extends GetxController {
  var count = 0;

  void jumpTwo() {
    Get.toNamed('/jump_two', arguments: {'msg': 'Hello from JumpOne'});
  }

  void increment() {
    count++;
    update();
  }
}
