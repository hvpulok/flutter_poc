import 'package:flutter/material.dart';
import './hello-button.dart';
import './camera-button.dart';
import 'package:flutter_poc/shared/battery.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: <Widget>[
            BatteryLevel(),
            CameraButton(),
            HelloButton(),
            RaisedButton(
              color: Colors.purple,
              child: Icon(
                Icons.place,
                size: 130,
                color: Colors.white24,
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.purple,
              child: Icon(
                Icons.fingerprint,
                size: 130,
                color: Colors.white24,
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.purple,
              child: Icon(
                Icons.mic,
                size: 130,
                color: Colors.white24,
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.purple,
              child: Icon(
                Icons.bluetooth_audio,
                size: 130,
                color: Colors.white24,
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.purple,
              child: Icon(
                Icons.phone,
                size: 130,
                color: Colors.white24,
              ),
              onPressed: () {},
            )
          ],
        );
      });
}
