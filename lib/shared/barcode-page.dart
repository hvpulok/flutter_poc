import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarcodePage extends StatefulWidget {
  @override
  _BarcodePageState createState() => new _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Barcode Scanner Example'),
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new RaisedButton(
                    color: Colors.greenAccent,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Icon(
                          Icons.scanner,
                          size: 130,
                          color: Colors.white24,
                        ),
                        new Text(
                          "Scan",
                          style: TextStyle(color: Colors.black87, fontSize: 25),
                        )
                      ],
                    ),
                    onPressed: scan),
                padding: const EdgeInsets.all(8.0),
              ),
              new Text(barcode,
                  style: TextStyle(color: Colors.black87, fontSize: 25)),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
