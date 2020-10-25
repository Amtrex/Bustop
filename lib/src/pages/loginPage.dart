import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LoginPages extends StatefulWidget {
  LoginPages({Key key}) : super(key: key);

  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackApp(),
          loginPage(),
          Center(
            child: tittles(),
          ),
        ],
      ),
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

  Widget loginPage() {
    return Center(
      child: Theme(
        child: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: ('Correo'),
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 1,
                color: Color.fromRGBO(251, 85, 23, 1),
              ),
            ),
          ),
        ),
        
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(251, 85, 23, 1),
        ),
      ),
    );
  }
}
