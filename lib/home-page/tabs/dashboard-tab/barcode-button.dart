import 'package:flutter/material.dart';
import './../../../shared/barcode-scanner-plugin.dart';
import 'dart:async';

class BarcodeButton extends StatefulWidget {
  @override
  _BarcodeButtonState createState() => _BarcodeButtonState();
}

class _BarcodeButtonState extends State<BarcodeButton> {
  String _message = '?';

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _scanBarcode,
      color: Colors.purple,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          SizedBox(
            width: 130.0,
            height: 130,
            child: Icon(Icons.scanner, size: 130.0, color: Colors.white10),
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
  Future<void> _scanBarcode() async {
    String message;
    try {
      final String result = await BarcodeScannerPlugin.scan();
      message = result;
    } catch (e) {
      message = "ERR!";
    }

    setState(() {
      _message = message;
    });
  }
}
