import 'package:flutter/material.dart';

class RowSpan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(
            child: Container(
              width: 160.0,
              color: Colors.blueGrey[50],
              child: Icon(Icons.assignment_ind,
                  size: 75.0, color: Colors.blueGrey),
            ),
          ),
          Card(
            child: Container(
              width: 160.0,
              color: Colors.blueGrey[50],
              child:
                  Icon(Icons.insert_chart, size: 100.0, color: Colors.orange),
            ),
          ),
          Card(
            child: Container(
              width: 160.0,
              color: Colors.blueGrey[50],
              child: Icon(Icons.attach_money, size: 100.0, color: Colors.green),
            ),
          ),
          Card(
            child: Container(
              width: 160.0,
              color: Colors.blueGrey[50],
              child: Icon(Icons.chat, size: 100.0, color: Colors.deepPurple),
            ),
          ),
          Card(
            child: Container(
              width: 160.0,
              color: Colors.blueGrey[50],
              child: Icon(Icons.help, size: 100.0, color: Colors.black12),
            ),
          ),
        ],
      ),
    );
  }
}
