// 5. 使用 AppThemeProvider 包裹你的 Widget 树，并提供主题数据
import 'package:flutter/material.dart';
import 'package:flutter_samples/InheritedWidget/app_theme_data.dart';
import 'package:flutter_samples/InheritedWidget/app_theme_provider.dart';
import 'package:flutter_samples/InheritedWidget/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 定义你的主题数据
    final appTheme = AppThemeData(
      primaryColor: Colors.blue,
      textStyle: const TextStyle(fontSize: 16, color: Colors.black87),
    );

    return AppThemeProvider(
      themeData: appTheme, // 提供主题数据
      child: MaterialApp(
        title: 'InheritedWidget Theme Demo',
        home: const MyHomePage(),
      ),
    );
  }
}
