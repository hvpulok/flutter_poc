import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './home-page/home-page.dart';
import './about-page/about-page.dart';
import './support-page/support-page.dart';

void main() => runApp(new MaterialApp(
    title: 'Flutter Starter',
    theme: new ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.indigo,
        accentColor: Colors.pinkAccent,
        backgroundColor: Colors.white),
    initialRoute: '/',
    routes: appRoutes));

Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
  '/about': (BuildContext context) => AboutPage(),
  '/support': (BuildContext context) => SupportPage(),
};
