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
          ActionCard(
            icon: Icons.insert_chart,
            label: 'Account Stats',
            iconColor: Colors.blue,
          ),
          ActionCard(
            icon: Icons.attach_money,
            label: 'Balance',
            iconColor: Colors.green,
          ),
          ActionCard(
            icon: Icons.assignment_ind,
            label: 'Profile',
          ),
          ActionCard(
            icon: Icons.chat,
            label: 'Chat',
            iconColor: Colors.orange,
          ),
          ActionCard(
            icon: Icons.help,
            label: 'Help',
            iconColor: Colors.black12,
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  ActionCard(
      {Key key, this.icon, this.label, this.iconColor = Colors.blueGrey});

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RaisedButton(
          onPressed: () {},
          color: Colors.blueGrey[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 130.0,
                child: Icon(icon, size: 75.0, color: iconColor),
              ),
              Text(
                label,
                style: TextStyle(color: Colors.black54),
              )
            ],
          )),
    );
  }
}
