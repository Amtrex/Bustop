import 'dart:ffi';
import 'dart:math';
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        backApp(),
        loginPage(),
        Center(
          child: tittles(),
        ),
      ],
    );
  }
  


  Widget loginPage(){

    //Para la comprovacion de los datos
    final formKey = GlobalKey<FormState>();
    String _correo, _contrasena;

    return Container(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                
                 SizedBox(
                  height: 320.0,
                ), 
                Theme(
                              child: Container(              
                     width: 320.0,
                    child:
                    TextFormField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),
                              hintText: ('Correo'),
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 1,color: Color.fromRGBO(251, 85, 23, 1),),
                              ),
                          ),
                          validator: (input) => !input.contains('control') ? 'Este Usuario no existe, intenta nuevamente' : null,
                          onSaved: (input) => _correo = input,
                        ),   
                  ),
                   data: Theme.of(context)
                                      .copyWith(primaryColor: Color.fromRGBO(251, 85, 23, 1),),
                ),                
                  SizedBox(
                  height: 10.0,
                ),
                
                Theme(
                              child: Container(
                    width: 320.0,
                    child: TextFormField(
                            maxLength: 20,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_open),
                              
                              border: OutlineInputBorder(borderRadius:BorderRadius.circular(30) ),
                                hintText: ('Contraseña'),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 1,color: Color.fromRGBO(251, 85, 23, 1),),
                              ),
                                contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            ),
                            autofocus: true,
                            validator: (input) => input.length < 8 ? 'Tu contraseña es demasiado corta intenta con otra' : null,
                            onSaved: (input) => _contrasena = input,
                            obscureText: true,
                          ),      
                  ),
                  data: Theme.of(context)
                  .copyWith(primaryColor: Color.fromRGBO(251, 85, 23, 1),),
                 ),
                   Container(
                  child: GestureDetector(
                    child: Text("¿Tienes problemas con tu usuario o contraseña?"),
                    onTap:(){Navigator.pushNamed(context, '/');}
                  )
                ),
               Expanded( 
                 child: Container(), ), 
                RaisedButton(
                  elevation: 8.0,
                  shape: StadiumBorder(),
                  color: Color(0xffdc4d1e),
                  child: Padding(
                    child:Text('INGRESAR', style: TextStyle( color: Colors.white),),
                    padding: EdgeInsets.symmetric(horizontal:90.0,vertical:15.0),
                  ),

                  //onPressed: _validar,
                
                  
                  onPressed: (){
                    Navigator.pushNamed(context, 'home');
                  },
                ),

                //Funcion submit----------------

                 //Void _validar (){
                  //if(formKey.currentState.validate()){
                   //formKey.currentState.save();
                   //print(_correo);
                  //print(_contrasena);
                //}},
              
                
                  SizedBox(
                  height: 6.0,
                ),
                 Container(
                  child: GestureDetector(
                    child: Text("¿Aun no tienes cuenta? ¡Registrate!" , style: TextStyle(color: Color(0xffea5724), fontSize: 12.0, )),
                    onTap:(){Navigator.pushNamed(context,'register');}
                  )
                ),
                SizedBox(
                  height: 28.0,
                ),        
              ],
            ),

        ),
      ),
    );
  }
}
  Widget backApp(){

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
        width: 360.0,
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

  Widget tittles() {
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
              "Ingresar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
