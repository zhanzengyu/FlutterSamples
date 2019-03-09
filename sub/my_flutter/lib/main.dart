import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF0F1F0),
        body: Center(
          child: _buildWidget(),
        ),
      ),
    );
  }

  Widget _buildWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Image.asset('assets/images/refresh.png', width: 49, height: 44,),
          SizedBox(
            height: 42.0,
          ),
          FlatButton(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              //注意这里 alpha 最大值是 255， sketch 上面最大值是 100
              color: Color.fromARGB(255, 13, 46, 172),
              //这里 onPressed 不能为 null，如果写 null 会怎样，大家可以试下~
              onPressed: (){},
              child: Text(
                '刷新',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

}