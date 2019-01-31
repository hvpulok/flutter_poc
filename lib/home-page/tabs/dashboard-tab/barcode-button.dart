import 'package:flutter/material.dart';

class BarcodeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/barcode');
      },
      color: Colors.purple,
      child: Stack(
        children: <Widget>[
          Container(
            width: 130.0,
            height: 130,
            child: Icon(Icons.scanner, size: 130.0, color: Colors.white10),
          ),
          SizedBox(
            width: 130.0,
            height: 130,
            child: Center(
              child: Text(
                'Scan Barcode',
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
