import 'dart:ui';
import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CircleBottoms extends StatefulWidget {
  @override
  _CircleBottomsState createState() => _CircleBottomsState();
}
final FirebaseAuth auth = FirebaseAuth.instance;
final uid = auth.currentUser.uid;


class _CircleBottomsState extends State<CircleBottoms> {
  @override
  Widget build(BuildContext context) {
     
    return bodyPage();
    
  }
  bodyPage(){
     return Table(
      children: [
        TableRow(children: [
          createCircleBottoms(context,Colors.white, Icons.timer,'Mis Tiempos','timePage'),
          createCircleBottoms(context,Colors.white, Icons.directions_bus,'Busetas','busPage'),
        ]),
        TableRow(children: [
          createCircleBottoms(context,Colors.white, Icons.edit_road,'Mis Rutas','routesPage'),
          createCircleBottoms(context,Colors.white, Icons.location_searching, 'Puntos de control','pointControlPage'),
        ]),
        TableRow(children: [
          createCircleBottoms(context,Colors.white, Icons.terrain,'Rutas de la ciudad','cityRoutesPage'),
          createCircleBottoms(context,Colors.white, Icons.departure_board,'tomar transporte','transportPage'),
        ]),
      ],
    );
  }
  Widget createCircleBottoms(BuildContext context, Color color, IconData icon, String data, String route){  

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: GestureDetector(
          child: Container(
            height: 140,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, .5),
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
                    icon,
                    color: color,
                    size: 40.0,
                  ),
                ),
                Text(
                  data,
                  style: TextStyle(color: Color.fromRGBO(251, 85, 23, 1), fontSize: 18, fontWeight: FontWeight.bold,), 
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          onTap:() {Navigator.pushNamed(context, route);}
        ),
      ),
    );
  }
}
  Widget HomePagee() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackApp(),
          ListView(
            children: <Widget>[TittlesBack(), CircleBottoms()],
          )
        ],
      ),
    );
  }
  class TittlesBack extends StatelessWidget {
  const TittlesBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            ImageBack(),
          ],
        ));
  }
}

class ImageBack extends StatelessWidget {
  const ImageBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/logoW.png'),
      height: 120,
      width: 120,
    );
  }
}
class AlertsDialog extends StatelessWidget {
  const AlertsDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
        title: Text('EN DESARROLLO'),
        content: Container(
          child: Wrap(
            children: [
              Text('Esta vista se encuentra en desarrollo'),
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(251, 85, 23, 1)),
                ),
              ),
            ],
          ),
        ),
      );
}
}