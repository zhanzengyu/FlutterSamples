import 'package:flutter/material.dart';
import 'package:flutter_samples/InheritedWidget/app_theme_provider.dart';
import 'package:flutter_samples/InheritedWidget/my_nested_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 6. 在子 Widget 中使用 AppTheme.of(context) 获取主题数据
    final theme = AppThemeProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Example'),
        backgroundColor: theme.primaryColor, // 使用主题颜色设置 AppBar 背景色
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This text uses the default style.',
              style: theme.textStyle, // 使用主题样式设置 Text 样式
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ... some action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor, // 使用主题颜色设置按钮背景色
              ),
              child: const Text('Button with Theme Color'),
            ),
            const SizedBox(height: 20),
            // 嵌套的子 Widget 也可以直接访问主题数据
            const MyNestedWidget(),
          ],
        ),
      ),
    );
  }
}