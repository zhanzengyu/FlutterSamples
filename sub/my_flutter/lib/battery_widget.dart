import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {

  static const MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');
  static const EventChannel eventChannel = EventChannel('samples.flutter.io/charging');

  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus = 'Battery status: unknown.';
  String _arguments = 'unknown';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    methodChannel.setMethodCallHandler((MethodCall call){
        if (call?.method == 'getContent') {
          setState(() {
            _arguments = call?.arguments ?? '';
          });
          return returnToRaw();
        }
    });
  }

  Future<String> returnToRaw() async {
    throw PlatformException(code: 'error code');
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
          Text(_chargingStatus),
          Text(_arguments),
        ],
      ),
    );
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
        PlatformException exception = error;
        _chargingStatus = exception?.message ?? 'Battery status: unknown.';
    });
  }

}
