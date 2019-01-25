import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DismissableCards extends StatefulWidget {
  DismissableCards({Key key}) : super(key: key);

  @override
  DismissableCardsState createState() {
    return DismissableCardsState();
  }
}

class DismissableCardsState extends State<DismissableCards> {
  final items = List<String>.generate(200, (i) => "Task ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify Widgets.
          key: Key(item),
          // We also need to provide a function that tells our app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from our data source.
            setState(() {
              items.removeAt(index);
            });

            // Then show a snackbar!
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$item Completed")));
          },
          // Show a red background as the item is swiped away
          background: Container(
              child: Icon(Icons.delete, size: 80, color: Colors.white70),
              color: Colors.red),
          child: ListTile(
            title: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle, size: 50),
                    title: Text('$item. Task Title'),
                    subtitle: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
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
            ),
          ),
        );
      },
    );
  }
}
