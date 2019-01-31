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
        DismissibleItem(
            itemValue: 'Home',
            dismissFn: onDismissed('Home'),
            nextRoute: '/',
            icon: Icons.home),
        DismissibleItem(
            itemValue: 'Accounts',
            dismissFn: onDismissed('Accounts'),
            nextRoute: '/accounts',
            icon: Icons.account_balance),
        DismissibleItem(
            itemValue: 'Support',
            dismissFn: onDismissed('Support'),
            nextRoute: '/support',
            icon: Icons.chat),
        DismissibleItem(
            itemValue: 'About',
            dismissFn: onDismissed('About'),
            nextRoute: '/about',
            icon: Icons.info),
        DismissibleItem(
            itemValue: 'Map',
            dismissFn: onDismissed('Map'),
            nextRoute: '/map',
            icon: Icons.map),
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

  onDismissed(String item) {
    print("$item removed");
  }
}

class DismissibleItem extends StatelessWidget {
  final String itemValue;
  final Function dismissFn;
  final String nextRoute;
  final IconData icon;
  DismissibleItem(
      {Key key,
      @required this.itemValue,
      this.nextRoute,
      this.icon,
      this.dismissFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(itemValue),
        background: Container(
          color: Colors.red,
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: dismissFn,
        movementDuration: Duration(milliseconds: 300),
        child: ListTile(
            leading: !icon.hashCode.isNaN ? Icon(icon) : null,
            title: Text(itemValue),
            onTap: () {
              if (nextRoute.isNotEmpty) {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(nextRoute);
              }
            }));
  }
}
