// 2. 创建 InheritedWidget 子类
import 'package:flutter/material.dart';
import 'package:flutter_samples/InheritedWidget/app_theme_data.dart';

class AppThemeProvider extends InheritedWidget {
  final AppThemeData themeData; // 要共享的主题数据

  const AppThemeProvider({
    Key? key,
    required this.themeData,
    required Widget child,
  }) : super(key: key, child: child);

  // 3. 定义一个静态方法，方便子 Widget 获取最近的 AppThemeProvider
  static AppThemeData of(BuildContext context) {
    // 查找 Widget 树中最近的 AppThemeProvider
    final AppThemeProvider? provider = context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
    if (provider == null) {
      throw FlutterError(
        'AppTheme.of() called with a context that does not contain an AppThemeProvider.\n'
            'Make sure your AppThemeProvider is an ancestor of the Widget using AppTheme.of.',
      );
    }
    return provider.themeData;
  }

  // 4. 重写 updateShouldNotify 方法，决定当 AppThemeProvider rebuild 时，是否需要通知依赖它的子 Widget
  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) {
    // 只有当 themeData 发生变化时才通知子 Widget 重建
    return themeData != oldWidget.themeData;
  }
}