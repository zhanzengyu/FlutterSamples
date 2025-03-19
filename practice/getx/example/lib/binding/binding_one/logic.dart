import 'package:get/get.dart';
import 'package:getx_example/config/route_config.dart';

class BindingOneLogic extends GetxController {
  void jump() => Get.toNamed(RouteConfig.bindingTwo);
}
