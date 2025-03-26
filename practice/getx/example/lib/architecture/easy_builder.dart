import 'package:flutter/cupertino.dart';
import 'package:getx_example/architecture/easy_x_controller.dart';

import 'easy.dart';
/// 刷新控件，自带回收机制
class EasyBuilder<T extends EasyXController> extends StatefulWidget {
  final Widget Function(T logic) builder;
  final String? tag;
  final bool autoRemove;

  const EasyBuilder({
    Key? key,
    required this.builder,
    this.tag,
    this.autoRemove = true,
  }) : super(key: key);


  @override
  State<EasyBuilder> createState() => _EasyBuilderState<T>();
}

class _EasyBuilderState<T extends EasyXController> extends State<EasyBuilder<T>> {
  late T _controller;

  @override
  void initState() {
    super.initState();
    _controller = Easy.find<T>(tag: widget.tag);
    _controller.xNotifier.addListener(update);
  }

  @override
  void dispose() {
    _controller.xNotifier.removeListener(update);
    if (widget.autoRemove) {
      Easy.delete<T>(tag: widget.tag);
    }
    super.dispose();
  }

  void update() {
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_controller);
  }
}