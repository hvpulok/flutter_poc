import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/home.dart';
import './tabs/dashboard.dart';
import './tabs/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => HomeTabs();
}

class HomeTabs extends StatefulWidget {
  @override
  HomeTabsState createState() => HomeTabsState();
}

class HomeTabsState extends State<HomeTabs> {
  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(

      //App Bar
      appBar: AppBar(
        title: Text(
          _title_app,
          style: TextStyle(
            fontSize:
                Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),

      //Content of tabs
      body: PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[Home(), Dashboard(), Settings()],
        scrollDirection: Axis.horizontal,
      ),

      //Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoTabBar(
              activeColor: Colors.pinkAccent,
              currentIndex: _tab,
              onTap: onTap,
              items: TabItems.map((TabItem) {
                return BottomNavigationBarItem(
                  title: Text(TabItem.title),
                  icon: Icon(TabItem.icon),
                );
              }).toList(),
            )
          : BottomNavigationBar(
              currentIndex: _tab,
              onTap: onTap,
              items: TabItems.map((TabItem) {
                return BottomNavigationBarItem(
                  title: Text(TabItem.title),
                  icon: Icon(TabItem.icon),
                );
              }).toList(),
            ),

      //Drawer
      drawer: Drawer(
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
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      )));

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;

      case 2:
        this._title_app = TabItems[2].title;
        break;
    }
  }
}

class TabItem {
  const TabItem({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
  const TabItem(title: 'Dashboard', icon: Icons.dashboard),
  const TabItem(title: 'Settings', icon: Icons.settings)
];
