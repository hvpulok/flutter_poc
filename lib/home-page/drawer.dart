import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Container(
          height: 120.0,
          child: DrawerHeader(
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Color(0xFFECEFF1),
            ),
            child: Center(
              child: FlutterLogo(
                colors: Colors.pink,
                size: 54.0,
              ),
            ),
          ),
        ),
        ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/');
            }),
        ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Accounts'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/accounts');
            }),
        ListTile(
            leading: Icon(Icons.chat),
            title: Text('Support'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/support');
            }),
        ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/about');
            }),
        ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/map');
            }),
        Divider(),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log in'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/login');
            }),
      ],
    ));
  }
}
