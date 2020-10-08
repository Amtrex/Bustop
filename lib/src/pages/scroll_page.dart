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
        children: [
          SizedBox(height: 20.0,),
          Text('Bustop', style: TextStyle(color: Colors.white, fontSize: 50.0),),
          Text('Bienvenidos', style: TextStyle(color: Colors.white, fontSize: 20.0),),
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
          children: [
            RaisedButton(
              shape: StadiumBorder(),
              child: Text('Login'),
              onPressed: (){
              },
            ),
            SizedBox(width: 20.0,),
            RaisedButton(
              shape: StadiumBorder(),
              child: Text('Register'),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }

  
}