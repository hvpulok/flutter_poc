import 'package:flutter/material.dart';
import './camera-button.dart';
import 'package:flutter_poc/shared/battery.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BatteryLevel(),
            CameraButton(),
            new Text(
              'Plugins Dashboard',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      );
}
