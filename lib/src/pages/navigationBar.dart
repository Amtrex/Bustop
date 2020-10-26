import 'dart:math';
import 'dart:ui';
import 'package:bustop/src/Widgets/homePageWidgets.dart';
import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:bustop/src/pages/qrPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  //State class
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(251, 85, 23, 1),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.map, size: 30),
            Icon(Icons.code, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          color: Color.fromRGBO(251, 85, 23, 1),
          child: Center(
            child: _choosePage(),
          ),
        ));
  }

  Widget _choosePage() {
    if (_page == 0) {
      return HomePage();
    }
    if (_page == 1) {
      return AlertsDialog();
    }
    if (_page == 2) {
      return QrPage();
    }
  }


}




