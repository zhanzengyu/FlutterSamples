import 'package:flutter/material.dart';

// 1. 定义要共享的数据类 (可选，但推荐)
class AppThemeData {
  final Color primaryColor;
  final TextStyle textStyle;

  AppThemeData({required this.primaryColor, required this.textStyle});

// 可以添加一些主题相关的辅助方法，例如根据主题颜色生成按钮样式等
}