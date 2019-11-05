import 'package:flutter/material.dart';

import 'package:speedometer/about.dart';

import 'home.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Speedometer',
      theme: ThemeData(primaryColor: Colors.lightBlueAccent.shade100),
      home: MyHomePage(),
      routes: {"/about": (BuildContext context) => About()},
      debugShowCheckedModeBanner: false,
    );
  }
}
