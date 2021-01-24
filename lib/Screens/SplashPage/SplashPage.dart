import 'package:flutter/material.dart';

String _message = '';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Loading();
  }

  Loading() {
    setState(
      () {
        _message = "잠시만 기다려주세요 ^^ (초기화 코드 구현할 것)";

        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(
            context,
            "/home",
            /*arguments*/
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Text(
            "$_message",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
