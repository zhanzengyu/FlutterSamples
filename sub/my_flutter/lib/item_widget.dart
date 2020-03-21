import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter/item_bean.dart';

/// 定义一个回调接口
typedef OnItemClickListener = void Function(int position, ItemBean itemBean);

class ItemWidget extends StatefulWidget {
  final int position;
  final ItemBean itemBean;
  final OnItemClickListener listener;

  ItemWidget(this.position, this.itemBean, this.listener);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  Color _color;

  @override
  void initState() {
    super.initState();
    _color = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      color: _color,
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text(widget?.itemBean?.title ?? ''),
          SizedBox(
            height: 6,
          ),
          Text(widget?.itemBean?.description ?? ''),
          SizedBox(
            height: 8,
          ),
          Divider(color: Colors.grey, height: 0.5,),
        ],
      ),
    );
    return GestureDetector(
      child: container,
      onTap: () => widget.listener(widget.position, widget.itemBean),
      onTapDown: (_) => _updatePressedColor(),
      onTapUp: (_) => _updateNormalColor(),
      onTapCancel: () => _updateNormalColor(),
    );
  }

  void _updateNormalColor() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _color = Colors.white;
      });
    });
  }

  void _updatePressedColor() {
    setState(() {
      _color = Colors.grey;
    });
  }
}