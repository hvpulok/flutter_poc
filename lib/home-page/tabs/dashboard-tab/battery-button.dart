import 'dart:async';

import 'package:flutter/material.dart';
import './../../../shared/battery-plugin.dart';

class BatteryButton extends StatefulWidget {
  @override
  _BatteryButtonState createState() => _BatteryButtonState();
}

class _BatteryButtonState extends State<BatteryButton> {
  String _batteryLevel = '?';

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _getBatteryLevel,
      color: Colors.purple,
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

  // Communicate to Native
  Future<void> _getBatteryLevel() async {
    String message;
    try {
      final String result = await BatteryLevelPlugin.getBatteryLevel();
      message = result.toString();
    } catch (e) {
      print(e);
      message = "ERR!";
    }

    setState(() {
      _batteryLevel = message;
    });
  }
}
