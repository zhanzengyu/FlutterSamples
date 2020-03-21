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
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget?.itemBean?.title ?? ''),
          SizedBox(
            height: 6,
          ),
          Text(widget?.itemBean?.description ?? ''),
          Divider(color: Colors.grey),
        ],
      ),
    );
    return GestureDetector(
      child: container,
      onTap: () => widget.listener(widget.position, widget.itemBean),
    );
  }
}