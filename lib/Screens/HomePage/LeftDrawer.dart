import 'package:flutter/material.dart';

bool _Login = false;

Widget SlidePage(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("찬홍 쇼핑몰"),
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(
              context,
              "/login",
              /*arguments*/
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text("Login"),
              ],
            ),
          ),
        ),
        Spacer(),
        Icon(Icons.icecream),
        Icon(Icons.icecream),
        Icon(Icons.icecream),
      ],
    ),
  );
}
