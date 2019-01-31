import 'package:flutter/material.dart';
import './../../../shared/hello-plugin.dart';
import 'dart:async';

class HelloButton extends StatefulWidget {
  @override
  _HelloButtonState createState() => _HelloButtonState();
}

class _HelloButtonState extends State<HelloButton> {
  String _message = 'Say Hello To Native UI';

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

  // Communicate to Native
  Future<void> _sayHelloToNative() async {
    String message;
    try {
      final String result = await HelloPluginDemo.sayHelloToNative();
      message = result;
    } catch (e) {
      message = "ERR!";
    }

    setState(() {
      _message = message;
    });
  }
}
