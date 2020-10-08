import 'dart:math';

import 'package:bustop/src/pages/home_page.dart';
import 'package:flutter/material.dart';
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
         _login_page(),
          
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

    Widget _login_page(){
    return Container(
      width : double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            
             SizedBox(
              height: 330.0,
            ), 

            Container(              
               width: 320.0,
              child:
              TextFormField(
                    maxLength: 20,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),
                        hintText: ('Correo'),
                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),

                    ),
                    validator: (input) => !input.contains('@') ? 'Not a valid Email' : null,
                  ),           
            ),
      
            
              SizedBox(
              height: 20.0,
            ), 

            Container(
              width: 320.0,
              child: TextFormField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30) ),
                          hintText: ('Contraseña'),
                          contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      ),
                      validator: (input) => !input.contains('@') ? 'Not a valid Email' : null,
                      obscureText: true,
                    ),
            ),       

               Container(
              child: GestureDetector(
                child: Text("¿Tienes problemas con tu usuario o contraseña?"),

                onTap:(){Navigator.pushNamed(context, 'home');}

              )

            ),

           Expanded( child: Container(), ), 


            RaisedButton(
              shape: StadiumBorder(),
              color: Color(0xffdc4d1e),
              child: Padding(
                child:Text('INGRESAR', style: TextStyle( color: Colors.white),),
                padding: EdgeInsets.symmetric(horizontal:90.0,vertical:15.0),
              ),
              onPressed: (){},
            ),


            SizedBox(
              height: 30.0,
            ),

            
          ],
        ),
      ),
    );

      final orangeBox2 = Transform.rotate(
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
      Positioned(
        top: -100.0,
        child: orangeBox2
        )
    ],
  );
}
}
