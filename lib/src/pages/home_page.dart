import 'dart:math';

import 'package:bustop/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
      children: <Widget>[
        backApp(),  

        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
              tittles()
            ],
          ),
        )
      ],
      ),
    );
  }
Widget backApp(){
  final gradiente = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset(0.0,0.6),
        end: FractionalOffset(0.0,1.0),
        colors: [
           Colors.white,
            Color.fromRGBO(200, 200, 200, 1)
        ]),
      ),
  );

  final orangeBox = Transform.rotate(
    angle: -pi / 4.3,
    child: Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(251, 85, 23, 1),
        borderRadius: BorderRadius.circular(60.0)
      ),
    ),
  );
  
  

  return Stack(
    children: <Widget> [
      gradiente,
      Positioned(
        top: -100.0,
        child: orangeBox
        )
    ],
  );
}

Widget tittles(){
return Container(
  padding: EdgeInsets.all(40.0),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget> [
    Text("Bustop", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),)
  ],
)
);
}

}