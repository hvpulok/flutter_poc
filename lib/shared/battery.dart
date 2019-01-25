import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevel extends StatefulWidget {
  @override
  _BatteryLevelState createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  static const platform = const MethodChannel('phoenix.flutter.io/battery');
  String _batteryLevel = '?';

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _getBatteryLevel,
      color: Colors.pinkAccent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          SizedBox(
            width: 130.0,
            height: 130,
            child: Icon(Icons.battery_std, size: 130.0, color: Colors.white24),
          ),
          SizedBox(
            width: 130.0,
            height: 130.0,
            child: Center(
              child: Text(
                _batteryLevel,
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Get battery level.
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '$result%';
    } on PlatformException catch (e) {
      batteryLevel = "ERR!";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
