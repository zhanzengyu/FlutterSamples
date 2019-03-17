import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {

  static const MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');

  String _batteryLevel = 'Battery level: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
      print('enter here');
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
      print('enter exception');
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_batteryLevel),
          RaisedButton(
            child: const Text('Refresh'),
            onPressed: _getBatteryLevel,
          ),
        ],
      ),
    );
  }
}
