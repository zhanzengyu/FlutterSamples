import 'package:get/get.dart';
import 'package:getx_example/architecture_rx_usage/easy_x_ebs_counter_page.dart';
import 'package:getx_example/architecture_usage/easy_x_counter_page.dart';
import 'package:getx_example/binding/binding_one/binding.dart';
import 'package:getx_example/binding/binding_one/view.dart';
import 'package:getx_example/binding/binding_two/binding.dart';
import 'package:getx_example/binding/binding_two/view.dart';
import 'package:getx_example/easy/jump_two/view.dart';

class RouteConfig {
  static const String bindingOne = '/bindingOne';
  static const String bindingTwo = '/bindingTwo';
  static const String jumpTwo = '/jump_two';
  static const String easyXCounterPage = '/EasyXCounterPage';
  static const String easyXEbsCounterPage = '/EasyXEbsCounterPage';

  static final List<GetPage> getPages = [
    GetPage(
      name: bindingOne,
      page: () => BindingOnePage(),
      binding: BindingOneBinding(),
    ),
    GetPage(
      name: bindingTwo,
      page: () => BindingTwoPage(),
      binding: BindingTwoBinding(),
    ),
    GetPage(
      name: jumpTwo,
      page: () => JumpTwoPage(),
    ),
    GetPage(name: easyXCounterPage, page: () => EasyXCounterPage()),
    GetPage(name: easyXEbsCounterPage, page: () => EasyXEbsCounterPage()),
  ];
}
