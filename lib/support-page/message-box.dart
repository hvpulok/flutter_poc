import 'package:flutter/material.dart';
import 'package:flutter_poc/shared/dismissable-cards.dart';

class MessageBox extends StatefulWidget {
  MessageBox({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MessageBoxState createState() => new _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Expanded(
          child: new Container(
            color: Colors.blueGrey,
            child: DismissableCards(),
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.blueGrey,
                width: 5.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: new TextField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Chat message',
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.send), onPressed: (){},)
            ],
          ),
        ),
      ],
    );
  }
}
