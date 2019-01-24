import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/home-tab/home-tab.dart';
import './tabs/dashboard-tab/dashboard-tab.dart';
import './tabs/settings-tab/settings-tab.dart';
import './drawer.dart';

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
        children: <Widget>[HomeTab(), DashboardTab(), SettingsTab()],
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
      drawer: HomeDrawer());

  void onTap(int tab) {
    // _tabController.jumpToPage(tab);
    _tabController
      ..animateToPage(tab,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);
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
