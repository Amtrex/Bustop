import 'dart:math';

import 'package:flutter/material.dart';

class RegisterPage  extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         backApp(),
        registerPage(),
        Center(
        child: tittles(),
      ),
        ], 
      ),
    );  
  }

    Widget registerPage(){
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
             SizedBox(
              height: 293.0,
            ), 

             Container(
               width: 320.0,
                child: 
                Text("¿Con cual de los siguientes perfiles quisieras registrarte?",
                 textAlign: TextAlign.center,
                ),   
            ),

            SizedBox(
              height: 50.0,
            ),

               RaisedButton(
                 elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: Color(0xffdc4d1e))
              ),
              color: Color(0xffffffff),
              child: Padding(
                child:Text('Usuario', style: TextStyle( color: Color(0xffdc4d1e)),),
                padding: EdgeInsets.symmetric(horizontal:100.0,vertical:15.0),
              ),
              onPressed: (){},
            ),
              SizedBox(
              height: 10.0,
            ),

            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: Color(0xffdc4d1e))
              ),
              color: Color(0xffffffff),
              child: Padding(
                child:Text('Conductor', style: TextStyle( color: Color(0xffdc4d1e)),),
                padding: EdgeInsets.symmetric(horizontal:92.0,vertical:15.0),
              ),
              onPressed: (){},
            ),
              SizedBox(
              height: 10.0,
            ),

            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: Color(0xffdc4d1e))
              ),
              color: Color(0xffffffff),
              child: Padding(
                child:Text('Personal de control', style: TextStyle( color: Color(0xffdc4d1e)),),
                padding: EdgeInsets.symmetric(horizontal:65.0,vertical:15.0),
              ),
              onPressed: (){},
            ),
              SizedBox(
              height: 10.0,
            ),

            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: Color(0xffdc4d1e))
              ),
              color: Color(0xffffffff),
              child: Padding(
                child:Text('Administrativo', style: TextStyle( color: Color(0xffdc4d1e)),),
                padding: EdgeInsets.symmetric(horizontal:80.0,vertical:15.0),
              ),
              onPressed: (){},
            ),
              SizedBox(
              height: 10.0,
            ),
            
            
              
           Expanded( child: Container(), ), 
            RaisedButton(
              elevation: 8.0,
              shape: StadiumBorder(),
              color: Color(0xffdc4d1e),
              child: Padding(
                child:Text('CONTINUAR', style: TextStyle( color: Color(0xffffffff)),),
                padding: EdgeInsets.symmetric(horizontal:90.0,vertical:15.0),
              ),
              onPressed: (){},
            ),
              SizedBox(
              height: 10.0,
            ),
             Container(
              child: GestureDetector(
                child: Text("¿Ya tienes una cuenta?¡Ingresa!" , style: TextStyle(color: Color(0xffea5724), fontSize: 12.0, )),
                onTap:(){Navigator.pushNamed(context, '/');}
              )
            ),
            SizedBox(
              height: 30.0,
            ),        
          ],
        ),
      ),
    );
}
    Widget backApp(){
        SingleChildScrollView(
              child: Column(
                children: <Widget>[
                
                ],
              ),
            );
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
        angle: -pi / 1.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(251, 85, 23, 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(120.0),
              topLeft: Radius.circular(20.0)
            )
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
  padding: EdgeInsets.all(60.0),
child: Column(
  children: <Widget>[
    image(),
    desc()
  ],
)
);
}
    Widget image(){
  return Image(
        image: AssetImage('assets/logoW.png'),
        height: 120,
        width: 120,
        );
}
    Widget desc(){
  return Container(
  padding: EdgeInsets.all(40.0),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget> [
    Text("Ingresar", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),)
  ],
)
);
}
}
