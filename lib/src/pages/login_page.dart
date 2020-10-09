
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
    child:  loginPage(context)
    );
  }

  Widget loginPage(context){
    return Container(

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
                onTap:(){Navigator.pushNamed(context, '/');}
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
              height: 10.0,
            ),
             Container(
              child: GestureDetector(
                child: Text("¿Aun no tienes cuenta? ¡Registrate!" , style: TextStyle(color: Color(0xffea5724), fontSize: 12.0, )),
                onTap:(){Navigator.pushNamed(context,'register');}
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