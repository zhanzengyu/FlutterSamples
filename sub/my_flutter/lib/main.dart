import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _getCenterWidget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getBtn(context, 'right in',
            Tween(begin: Offset(1.0, 0.0), end: Offset.zero)),
        _getBtn(context, 'left in',
            Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)),
        _getBtn(context, 'bottom in',
            Tween(begin: Offset(0.0, 1.0), end: Offset.zero)),
        _getBtn(context, 'top in',
            Tween(begin: Offset(0.0, -1.0), end: Offset.zero)),
        _getScaleBtn(context, 'scale in', Tween(begin: 0.5, end: 1.0)),
      ],
    ));
  }
}

Widget _getScaleBtn(BuildContext context, String textContent, Tween<double> tween) {
  return RaisedButton(
      child: Text(textContent),
      onPressed: () {
        Navigator.of(context).push(_createScaleRoute(tween));
      });
}

Route _createScaleRoute(Tween<double> tween) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation.drive(tween.chain(CurveTween(curve: Curves.ease))),
          child: child,
        );
      });
}

Widget _getBtn(BuildContext context, String textContent, Tween<Offset> tween) {
  return RaisedButton(
      child: Text(textContent),
      onPressed: () {
        Navigator.of(context).push(_createRoute(tween));
      });
}

Route _createRoute(Tween<Offset> tween) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
          animation.drive(tween.chain(CurveTween(curve: Curves.ease))),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
    return _getCenterWidget(Text('Page2'));
  }
}

Widget _getCenterWidget(Widget child) {
  return Scaffold(
    appBar: AppBar(),
    body: Center(
      child: child,
    ),
  );
}