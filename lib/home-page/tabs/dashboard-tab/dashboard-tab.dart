import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.account_circle, size: 50),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text(
                            'Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Action-1'),
                              onPressed: () {/* ... */},
                            ),
                            FlatButton(
                              child: const Text('Action-2'),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      );
}
