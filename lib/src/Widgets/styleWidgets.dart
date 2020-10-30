import 'dart:math';
import 'package:flutter/material.dart';

class BackApp extends StatelessWidget {
  const BackApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingleChildScrollView(
      child: Column(
        children: <Widget>[],
      ),
    );
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
      angle: -pi / 1.0,
      child: Container(
        height: 360.0,
        width: 400,
        decoration: BoxDecoration(
            color: Color.fromRGBO(251, 85, 23, 1),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(120.0),
                topLeft: Radius.circular(20.0))),
      ),
    );

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: orangeBox)],
    );
  }
}

class TopScreen extends StatelessWidget {
   const TopScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251, 85, 23, 1),
      ),
      body: BackApp(),
    );
}
}
class Tittles extends StatelessWidget {
  const Tittles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(60.0),
        child: Column(
          children: <Widget>[image(), desc()],
        ));
  }
  Widget image() {
    return Image(
      image: AssetImage('assets/logoW.png'),
      height: 120,
      width: 120,
    );
  }

  Widget desc() {
    return Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Registrate",
              style: TextStyle(
                decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  
}

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text(title),
       backgroundColor: Color.fromRGBO(251, 85, 23, 1),
     ),
    );
  }
}


