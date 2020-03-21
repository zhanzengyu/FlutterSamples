import 'package:flutter/material.dart';
import 'package:my_flutter/item_bean.dart';

class ItemWidget extends StatefulWidget {
  final ItemBean itemBean;

  ItemWidget(this.itemBean);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}