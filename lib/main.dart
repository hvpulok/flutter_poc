import 'package:flutter/material.dart';
import 'package:flutter_poc/src/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo,
          accentColor: Colors.blueAccent),
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
      // home: HomePage(title: 'Phoenix Flutter POC'),
    );
  }
}

// TODOS:
// - Add drawer
// - Add bottom navbar
