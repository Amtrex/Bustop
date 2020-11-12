import 'dart:ui';
import 'package:bustop/src/Widgets/homePageWidgets.dart';
import 'package:bustop/src/pages/home_page.dart';
import 'package:bustop/src/pages/maps_page.dart';
import 'package:bustop/src/pages/qrPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final uid = auth.currentUser.uid;

class _NavigationBarState extends State<NavigationBar> {
  //State class
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  var rol;
  @override
  Widget build(BuildContext context) {
    getUserRol();
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(251, 85, 23, 1),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.map, size: 30),
            Icon(Icons.qr_code, size: 30),
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
            child: choosePage(),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  Future getUserRol() async {
    rol = '';
    setState(() async {
      await FirebaseFirestore.instance
          .collection('tblUsuarios')
          .where("idUsuario", isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['idUsuario'] == uid) {
            rol = doc['rol'];
            if (rol != null) {
              setState(() {
                choosePage();
              });
            }
          }
        });
      });
    });
  }

  choosePage() {
    if (_page == 0) {
      return HomePage(
        rol: rol,
      );
    }
    if (_page == 1) {
      return MapsPage();
    }
    if (_page == 2) {
      return QrPage();
    }
  }
}
