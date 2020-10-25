import 'dart:math';
import 'dart:ui';

import 'package:bustop/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
        FocusScope.of(context).requestFocus(FocusNode());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[tittles(), circleBottoms()],
            ),
          )
        ],
      ),
      bottomNavigationBar: botonNavigationBar(context),
    );
  }

  Widget backApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [Colors.white, Color.fromRGBO(200, 200, 200, 1)]),
      ),
    );

    final orangeBox = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: 350.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Color.fromRGBO(251, 85, 23, 1),
            borderRadius: BorderRadius.circular(60.0)),
      ),
    );

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: orangeBox)],
    );
  }

  Widget tittles() {
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            image(),
          ],
        ));
  }

  Widget image() {
    return Image(
      image: AssetImage('assets/logoW.png'),
      height: 120,
      width: 120,
    );
  }

  Widget botonNavigationBar(BuildContext context) {
    // FocusScope.of(context).requestFocus(FocusNode());
    return Theme(
      data: Theme.of(context).copyWith(

        canvasColor: Colors.white60,
        primaryColor: Color.fromRGBO(251, 85, 23, 1),
        textTheme: Theme.of(context).textTheme.copyWith(caption:TextStyle(color: Color.fromRGBO(169, 169, 168, 0.9)))

      ) ,
      child: BottomNavigationBar(
          onTap: (tabIndex) {
            print(tabIndex);
            if (tabIndex == 0) {
              Navigator.of(context).pushNamed(
                'home',
              );
            }
            
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                'qr',
              );
            }
          },
          unselectedItemColor: Color.fromRGBO(150, 139, 139, .9),
          selectedItemColor: Color.fromRGBO(251, 85, 23, 1),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(251, 85, 23, 1),
              ),
              title: Text('Inicio'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color:Color.fromRGBO(150, 139, 139, .9),
              ),
              title: Text('Mapa'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.code,
                color: Color.fromRGBO(150, 139, 139, .9),
              ),
              title: Text('QR'),
            ),

          ],
        ),

    );
  }

  Widget circleBottoms() {
    return Table(
      children: [
        TableRow(children: [
          createCircleBottom(),
          createCircleBottom(),
        ]),
        TableRow(children: [
          createCircleBottom(),
          createCircleBottom(),
        ]),
        TableRow(children: [
          createCircleBottom(),
          createCircleBottom(),
        ]),
      ],
    );
  }


  Widget createCircleBottom() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          height: 140,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(245, 148, 115, 0.70),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(251, 85, 23, 1),
                radius: 35.0,
                child: Icon(
                  Icons.card_membership,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Text(
                'Obj',
                style: TextStyle(color: Color.fromRGBO(251, 85, 23, 1)),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),

      ),
    );
  }
}
