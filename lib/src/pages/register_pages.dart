import 'package:flutter/material.dart';

class RegisterPage  extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[registerPage(context),], ),
    );  
  }

    Widget registerPage(context){
    return Container(
      width : double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
             SizedBox(
              height: 250.0,
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
}
