import 'package:flutter/material.dart';
class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2()
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
          SizedBox(height: 20.0,),
          Text('BUSTOP', style: TextStyle(color: Colors.white, fontSize: 50.0),),
          Text('¡Bienvenidos!', style: TextStyle(color: Colors.white, fontSize: 20.0),),
          Expanded( child: Container(), ),
          Icon(Icons.keyboard_arrow_down, size: 90.0, color: Colors.white,)
        ],
      ),
    );
  }
    Widget _pagina2(){
    return Container(
      width : double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(251, 85, 23, 1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
            RaisedButton(
              shape: StadiumBorder(),
              color: Colors.white,
              child: Padding(
                child:Text('INGRESAR',),
                padding: EdgeInsets.symmetric(horizontal:90.0,vertical:15.0),
              ),
              onPressed: (){
                print('Click Ingresar');
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              shape: StadiumBorder(),
              color: Colors.white,
              child: Padding(
                child:Text('REGISTRARSE',),
                padding: EdgeInsets.symmetric(horizontal:80.0,vertical:15.0),
              ),
              onPressed: (){ 
                print('Click Registrarse');},
            ),
          ],
        ),
      ),
    );
  }

   Widget _textos2(){
    return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.0,),
          Text('Selecciona la accion que quieres realizar', style: TextStyle(color: Colors.white, fontSize: 30.0),),
        ],
      ),
    );
  }



  
}