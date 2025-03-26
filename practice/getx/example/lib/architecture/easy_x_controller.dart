import 'package:getx_example/architecture/easy_x_notifier.dart';
/// 缺少生命周期管理，需要补充
class EasyXController {
  EasyXNotifier xNotifier = EasyXNotifier();

  /// 刷新控件
  void update() {
    xNotifier.notify();
  }
}