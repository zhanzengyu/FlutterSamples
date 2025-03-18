# FlutterSample

当前分支改为了纯 Flutter 结构，如果要查看基于 Android 混合编程 Flutter 的话，请查看：

[混编 Flutter 示例代码](https://github.com/zhanzengyu/FlutterSamples/tree/mixed_master)

NOTE：

> 如果直接用 AndroidStudio 打开本项目，会识别为 Android 项目，并提示 Gradle Sync failed。  
>
> 需要使用 AndroidStudio 的 Open 打开 pubspec.yaml 文件进行项目导入。



#### [1. 使用InheritedWidget传递数据](./lib/InheritedWidget)

> 组成 app 的 widget 最终会形成一个树形结构。在传递数据的时候如果直接作为 widget 的参数传递不仅写起来麻烦也会造成不必要的重绘。使用`InheritedWidget`可以直接将数据从一个 widget 传到另外一个。
>
> (了解原理，目前有很多框架都基于此做了封装，比如 **Provider**、**GetX**等)

#### [2. StreamBuilder vs FutureBuilder](./lib/Builder)

- **FutureBuilder 适合一次性异步操作。** 例如，从网络加载数据并在 Widget 初始化时显示一次。 它的设计目的是处理单次异步操作的结果。 如果你需要 **周期性或持续更新 UI**，频繁地重新构建 FutureBuilder 并重新触发 Future 可能效率不高，尤其当 Future 的结果没有变化时，仍然可能触发 Widget 重建。

- **StreamBuilder 适合持续数据流。** 例如，实时数据更新 (股票价格、传感器数据)、聊天消息、进度更新等。 StreamBuilder 的优势在于 **事件驱动**。 它只会在 Stream 发出新事件时才更新 UI，避免了轮询或不必要的检查，减少了 Widget 重建的次数，从而可能提高性能，尤其是对于频繁更新的场景。
