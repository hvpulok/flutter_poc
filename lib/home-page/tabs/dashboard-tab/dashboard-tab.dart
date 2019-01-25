import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/camera');
              },
              color: Colors.pinkAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 130.0,
                    height: 130,
                    child:
                        Icon(Icons.camera, size: 75.0, color: Colors.white70),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                    child: Text(
                      'Camera',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            new Text(
              'Plugins Dashboard',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      );
}
