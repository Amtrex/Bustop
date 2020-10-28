import 'dart:math';
import 'package:bustop/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          //Hacer validacion si esta logeado ir a homepage si no ir a login
         LoginPage()
        ],
      ),
      
    );
  }

  Widget _pagina1(){
    return Stack(
      children: [
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width : double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(251, 85, 23, 1),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width : double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/fondo2.png'),
        fit: BoxFit.cover,
        ),
    );
  }

  Widget _textos(){
    return SafeArea(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Expanded( child: Container(), ),
          Icon(Icons.keyboard_arrow_down, size: 90.0, color: Colors.white,)
        ],
      ),
    );
  }

    
}
