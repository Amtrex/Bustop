import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _fondoApp(),
      ],
    );
  }
Widget _fondoApp(){
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
    angle: -pi / 4.0,
    child: Container(
  height: 330.0,
  width: 330.0,
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



}