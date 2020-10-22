import 'dart:math';

import 'package:bustop/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:Stack(
      children: <Widget>[
        backApp(),  

        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
              tittles(),
              circleBottoms()
            ],
          ),
        )
      ],
      ),
      bottomNavigationBar: botonNavigationBar(context),
    );
  }
  Widget backApp(){
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
    angle: -pi / 4.0,
    child: Container(
      height: 350.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(251, 85, 23, 1),
        borderRadius: BorderRadius.circular(60.0)
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
  padding: EdgeInsets.all(30.0),
child: Column(
  children: <Widget>[
    image(),
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
  Widget botonNavigationBar(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white60,
        primaryColor: Color.fromRGBO(251, 85, 23, 1),
        textTheme: Theme.of(context).textTheme.copyWith(caption:TextStyle(color: Color.fromRGBO(169, 169, 168, 0.9)))

      ) ,
      child: BottomNavigationBar(
          onTap: (tabIndex) {
            print(tabIndex);
            if (tabIndex == 0) {
              Navigator.of(context).pushNamed(
                'home',
              );
            }
            
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                'qr',
              );
            }
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                'qr',
              );
            }
          },
          unselectedItemColor: Color.fromRGBO(150, 139, 139, .9),
          selectedItemColor: Color.fromRGBO(164, 45, 47, .9),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(164, 45, 47, .9),
              ),
              title: Text('Inicio'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color:Color.fromRGBO(150, 139, 139, .9),
              ),
              title: Text('Mapa'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.code,
                color: Color.fromRGBO(150, 139, 139, .9),
              ),
              title: Text('QR'),
            ),

          ],
        ),
    );
  }
  Widget circleBottoms(){
    return Table(
      children: [
        TableRow(
          children: [
            createCircleBottom(),
            createCircleBottom(),
          ]
        ),
        TableRow(
          children: [
            createCircleBottom(),
            createCircleBottom(),
          ]
        ),
        TableRow(
          children: [
            createCircleBottom(),
            createCircleBottom(),
          ]
        ),
      ],
    );
  }
  Widget createCircleBottom(){
    return Container(
      height: 150,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(193, 193, 191, 0.8),
        borderRadius: BorderRadius.circular(15.0)
      ),
    );
  }

}





