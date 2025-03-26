import 'package:getx_example/architecture/easy_x_controller.dart';

class EasyXCounterLogic extends EasyXController {
  var count = 0;

  void increment() {
    count++;
    update();
  }
}