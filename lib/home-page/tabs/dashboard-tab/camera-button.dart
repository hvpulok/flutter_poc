import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/camera');
      },
      color: Colors.purple,
      child: Stack(
        children: <Widget>[
          Container(
            width: 130.0,
            height: 130,
            child: Icon(Icons.camera_alt, size: 130.0, color: Colors.white24),
          ),
          SizedBox(
            width: 130.0,
            height: 130,
            child: Center(
              child: Text(
                'Camera',
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
