import 'package:flutter/material.dart';
import 'package:my_flutter/item_bean.dart';
import 'package:my_flutter/item_widget.dart';

class ListViewWidget extends StatefulWidget {

  final OnItemClickListener listener;

  ListViewWidget(this.listener);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final List<ItemBean> itemBeans = [];

  @override
  void initState() {
    super.initState();

    _initData();
  }

  /// 实际场景可能是从网络拉取，这里演示就直接填充数据源了
  void _initData() {
    itemBeans.add(ItemBean('', ''));

    itemBeans.add(ItemBean('第一句', '关注微信公众号「AndroidTraveler」'));
    itemBeans.add(ItemBean('第二句', '星河滚烫，你是人间理想'));
    itemBeans.add(ItemBean('第三句', '我明白你会来，所以我等。'));
    itemBeans.add(ItemBean('第四句', '家人闲坐，灯火可亲。'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: itemBeans.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              color: Colors.blue,
              height: 66,
            );
          } else {
            return ItemWidget(index, itemBeans[index], widget.listener);
          }
        },
      ),
    );
  }
}