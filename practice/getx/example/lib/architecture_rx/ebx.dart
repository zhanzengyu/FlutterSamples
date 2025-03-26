import 'package:flutter/material.dart';
import 'package:getx_example/architecture_rx/rx_easy.dart';

typedef WidgetCallback = Widget Function();

class Ebx extends StatefulWidget {
  final WidgetCallback builder;

  const Ebx(this.builder, {Key? key}) : super(key: key);

  @override
  State createState() => _EbxState();
}

class _EbxState extends State<Ebx> {
  final RxEasy _rxEasy = RxEasy();

  @override
  void initState() {
    super.initState();

    _rxEasy.easyXNotifier.addListener(update);
  }

  void update() {
    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    _rxEasy.easyXNotifier.removeListener(update);
    super.dispose();
  }

  Widget get notifyChild {
    final observer = RxEasy.proxy;
    RxEasy.proxy = _rxEasy;
    final result = widget.builder();
    if (!_rxEasy.canUpdate) {
      throw 'Widget lacks Rx type variables';
    }
    RxEasy.proxy = observer;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return notifyChild;
  }
}