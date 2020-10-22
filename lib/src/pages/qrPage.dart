import 'package:bustop/src/pages/generate.dart';
import 'package:bustop/src/pages/scan.dart';
import 'package:flutter/material.dart';
//import 'package:qrcode/generate.dart';
//import 'package:qrcode/scan.dart';

class QrPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xffdc4d1e),
        title: Text("CODGIO QR"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(image: AssetImage('assets/Qricon.png'),
            height: 300,
            width: 120, ),
            flatButton("Scanear codigo QR", ScanPage()),
            SizedBox(height: 20.0,),
            flatButton("Crear codigo QR", GeneratePage()),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          onTap: (tabIndex) {
            print(tabIndex);
            if (tabIndex == 0) {
              Navigator.of(context).pushNamed(
                'home',
              );
            }
            
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                '',
              );
            }
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                'qr',
              );
            }
          },
          unselectedItemColor: Color.fromRGBO(150, 139, 139, .9),
          selectedItemColor: Color.fromRGBO(150, 139, 139, .9),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color:Color.fromRGBO(150, 139, 139, .9),
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
                color: Color.fromRGBO(164, 45, 47, .9),
              ),
              title: Text('QR'),
            ),

          ],
        ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Color(0xffdc4d1e),fontWeight: FontWeight.bold),
      ),

      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffdc4d1e),width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
