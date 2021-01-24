import 'package:flutter/material.dart';

import 'Screens/HomePage/HomePage.dart';
import 'Screens/LoginPage/LoginPage.dart';
import 'Screens/SplashPage/SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/home':(context) => new HomePage(),
        '/login':(context) => new LoginPage()
      },
    );
  }
}