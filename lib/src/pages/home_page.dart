import 'dart:ui';

import 'package:bustop/src/Widgets/homePageWidgets.dart';
import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final rol;
  HomePage({Key key, this.rol}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackApp(),
          ListView(
            children: [TittlesBack(), bodyPage(widget.rol)],
          ),
        ],
      ),
    );
  }

  bodyPage(rol) {
    if (rol == 'conductor') {
      return Table(
        children: [
          TableRow(children: [
            createCircleBottoms(
                context, Colors.white, Icons.timer, 'Mis Tiempos', 'timePage'),
            createCircleBottoms(context, Colors.white, Icons.directions_bus,
                'Busetas', 'busPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.edit_road,
                'Mis Rutas', 'routesPage'),
            createCircleBottoms(context, Colors.white, Icons.location_searching,
                'Puntos de control', 'pointControlPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.terrain,
                'Rutas de la ciudad', 'cityRoutesPage'),
            createCircleBottoms(context, Colors.white, Icons.departure_board,
                'tomar transporte', 'transportPage'),
          ]),
        ],
      );
    } else if (rol == 'usuario') {
      return Table(
        children: [
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.edit_road,
                'Mis Rutas', 'routesPage'),
            createCircleBottoms(context, Colors.white, Icons.terrain,
                'Rutas de la ciudad', 'cityRoutesPage'),
            // createCircleBottoms(context,Colors.white, Icons.timer,'Mis Tiempos','timePage'),
            // createCircleBottoms(context,Colors.white, Icons.directions_bus,'Busetas','busPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.departure_board,
                'tomar transporte', 'transportPage'),
            createCircleBottoms(context, Colors.white, Icons.location_searching,
                'Acerca de', '/'),
          ]),
        ],
      );
    } else if (rol == 'administrador') {
      return Table(
        children: [
          TableRow(children: [
            createCircleBottoms(
                context, Colors.white, Icons.timer, 'Mis Tiempos', 'timePage'),
            createCircleBottoms(context, Colors.white, Icons.directions_bus,
                'Busetas', 'busPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.edit_road,
                'Mis Rutas', 'routesPage'),
            createCircleBottoms(context, Colors.white, Icons.location_searching,
                'Puntos de control', 'pointControlPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.terrain,
                'Rutas de la ciudad', 'cityRoutesPage'),
            createCircleBottoms(context, Colors.white, Icons.departure_board,
                'tomar transporte', 'transportPage'),
          ]),
        ],
      );
    } else {
      return Table(
        children: [
          TableRow(children: [
            createCircleBottoms(
                context, Colors.white, Icons.timer, 'Mis Tiempos', 'timePage'),
            createCircleBottoms(context, Colors.white, Icons.directions_bus,
                'Busetas', 'busPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.edit_road,
                'Mis Rutas', 'routesPage'),
            createCircleBottoms(context, Colors.white, Icons.location_searching,
                'Puntos de control', 'pointControlPage'),
          ]),
          TableRow(children: [
            createCircleBottoms(context, Colors.white, Icons.terrain,
                'Rutas de la ciudad', 'cityRoutesPage'),
            createCircleBottoms(context, Colors.white, Icons.departure_board,
                'tomar transporte', 'transportPage'),
          ]),
        ],
      );
    }
  }

  Widget createCircleBottoms(BuildContext context, Color color, IconData icon,
      String data, String route) {
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
                    style: TextStyle(
                      color: Color.fromRGBO(251, 85, 23, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, route);
            }),
      ),
    );
  }
}
