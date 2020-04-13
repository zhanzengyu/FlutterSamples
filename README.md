# FlutterSample

## 用法

1. 拷贝仓库代码到你本地设备

```
git clone https://github.com/nesger/FlutterSample.git
```

2. 将项目导入到 Android Studio
3. 切换到对应分支  
4. 进入 flutter module 所在目录  

```
cd sub/my_flutter/
```

5. 执行下面命令

```
flutter packages get
```

6. 运行

```
flutter run
```

## 分支

**feature/main_template：** main.dart 路由模板

**feature/page_transition：** 界面切换动画 DIY

<hr/>

**PlatformChannel 相关分支**  

**feature/event_channel：** EventChannel 使用，实现原生到 Flutter 的通信   
**feature/method_channel_reverse：** MethodChannel 使用，实现 Android 到 Flutter 的通信   
**feature/method_channel：** MethodChannel 使用，实现 Flutter 到原生的通信

<hr/>

**布局刷新居中显示示例**  
**feature/ui-refresh-one：** 直接布局  
**feature/ui-refresh-two：** 两个 Widget 组合：Expanded Widget + Column Widget  
**feature/ui-refresh-three：** Column Widget + mainAxisAlignment 属性  
