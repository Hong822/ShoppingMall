import 'package:flutter/material.dart';

import 'LeftDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _AppbarElements(context),
        body: _BodyElements(),drawer
    :
    SlidePage
    (
    context
    )
    );
  }
}

Widget _AppbarElements(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,

    title: Text("바다건너 쇼핑몰"),
    actions: <Widget>[
      IconButton(
        tooltip: '검색',
        icon: const Icon(Icons.search),
        onPressed: (){
        },
      ),

    ],
  );
}

Widget _BodyElements() {
  return Center(
    child: Container(
      color: Colors.yellow,
      child: Text("Home"),
    ),
  );
}
