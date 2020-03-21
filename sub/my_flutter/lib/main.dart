import 'package:flutter/material.dart';
import 'package:my_flutter/listview_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _buildWidget(),
        ),
      ),
    );
  }

  Widget _buildWidget() {
    return ListViewWidget((position, itemBean){
      print('pos=$position, title='+itemBean.title+",description="+itemBean.description);
    });
  }
}