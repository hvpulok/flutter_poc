import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './accounts-page/accounts-page.dart';
import './home-page/home-page.dart';
import './about-page/about-page.dart';
import './support-page/support-page.dart';
import './login-page/login_page.dart';
import './shared/camera.dart';
import './shared/barcode-page.dart';
import './google-map-page/google-map-page.dart';

void main() => runApp(new MaterialApp(
    title: 'Flutter Starter',
    theme: new ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.indigo,
        accentColor: Colors.pinkAccent,
        backgroundColor: Colors.white),
    initialRoute: '/login',
    routes: appRoutes));

Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
  '/accounts': (BuildContext context) => AccountsPage(),
  '/about': (BuildContext context) => AboutPage(),
  '/support': (BuildContext context) => SupportPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/camera': (BuildContext context) => CameraPage(),
  '/barcode': (BuildContext context) => BarcodePage(),
  '/map': (BuildContext context) => MapPage()
};
