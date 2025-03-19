import 'package:get/get.dart';

class JumpTwoLogic extends GetxController {
  var count = 0;
  var msg = '';

  @override
  void onReady() {
    var map = Get.arguments;
    msg = map['msg'];
    update();

    super.onReady();
  }

  void increment() {
    count++;
    update();
  }
}
