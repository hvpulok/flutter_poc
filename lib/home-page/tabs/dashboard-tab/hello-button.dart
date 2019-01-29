import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelloPlugin extends StatefulWidget {
  @override
  _HelloPluginState createState() => _HelloPluginState();
}

class _HelloPluginState extends State<HelloPlugin> {
  static const platform = const MethodChannel('phoenix.flutter.io/info');
  String _message = '?';

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _sayHelloToNative,
      color: Colors.purple,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          SizedBox(
            width: 130.0,
            height: 130,
            child: Icon(Icons.message, size: 130.0, color: Colors.white10),
          ),
          SizedBox(
            width: 130.0,
            height: 130.0,
            child: Center(
              child: Text(
                _message,
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Get battery level.
  Future<void> _sayHelloToNative() async {
    String message;
    try {
      final String result = await platform.invokeMethod('hello');
      message = result;
    } on PlatformException catch (e) {
      message = "ERR!";
    }

    setState(() {
      _message = message;
    });
  }
}
