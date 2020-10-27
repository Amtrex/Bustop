import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:bustop/src/pages/regs_page.dart';
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double myHeight = 0.0;
  double myWidth = 0.0;
  Widget build(BuildContext context) {
    this.myHeight = MediaQuery.of(context).size.height * 0.03;
    this.myWidth = MediaQuery.of(context).size.width * 0.08;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackApp(),
          registerPage(),
          Center(
            child: Tittles(),
          ),
        ],
      ),
    );
  }

  Widget registerPage() {
    return Container(
      padding: EdgeInsets.only(top: 260),
      child: Center(
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
            ),
            Container(
              width: 320.0,
              child: Text(
                "¿Con cual de los siguientes perfiles quisieras registrarte?",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: myHeight,
            ),
            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Color(0xffdc4d1e))),
              color: Color(0xffffffff),
              child: Padding(
                child: Text(
                  'Usuario',
                  style: TextStyle(color: Color(0xffdc4d1e)),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'regs');
              },
            ),
            SizedBox(
              height: myHeight,
            ),
            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Color(0xffdc4d1e))),
              color: Color(0xffffffff),
              child: Padding(
                child: Text(
                  'Conductor',
                  style: TextStyle(color: Color(0xffdc4d1e)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 92.0, vertical: 15.0),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: myHeight,
            ),
            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Color(0xffdc4d1e))),
              color: Color(0xffffffff),
              child: Padding(
                child: Text(
                  'Personal de control',
                  style: TextStyle(color: Color(0xffdc4d1e)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 15.0),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: myHeight,
            ),
            RaisedButton(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Color(0xffdc4d1e))),
              color: Color(0xffffffff),
              child: Padding(
                child: Text(
                  'Administrativo',
                  style: TextStyle(color: Color(0xffdc4d1e)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              ),
              onPressed: () {},
            ),
            Container(
              height: 70,
            ),
            Divider(color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Ya tienes una cuenta?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    )),
                GestureDetector(
                  child: Text("¡Ingresa!",
                      style: TextStyle(
                        color: Color(0xffea5724),
                        fontSize: 12.0,
                      )),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => ScrollPage()),
                        ModalRoute.withName("/"));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
