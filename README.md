# FlutterSample

当前分支改为了纯 Flutter 结构，如何要查看基于 Android 混合编程 Flutter 的话，请查看：

[混编 Flutter 示例代码](https://github.com/zhanzengyu/FlutterSamples/tree/mixed_master)

#### [1. 使用InheritedWidget传递数据](./lib/InheritedWidget)

> 组成 app 的 widget 最终会形成一个树形结构。在传递数据的时候如果直接作为 widget 的参数传递不仅写起来麻烦也会造成不必要的重绘。使用`InheritedWidget`可以直接将数据从一个 widget 传到另外一个。
>
> (了解原理，目前有很多框架都基于此做了封装，比如 **Provider**、**GetX**等)



