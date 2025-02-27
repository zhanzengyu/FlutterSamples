import 'package:flutter/material.dart';
import 'package:flutter_samples/InheritedWidget/app_theme_provider.dart';

class MyNestedWidget extends StatelessWidget {
  const MyNestedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 嵌套的子 Widget 仍然可以直接访问主题数据
    final theme = AppThemeProvider.of(context);

    return Text(
      'This text is in a nested widget and still uses the theme style.',
      style: theme.textStyle, // 仍然可以使用主题样式
    );
  }
}
