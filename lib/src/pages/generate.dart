import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData =
      "https://github.com/neon97";  // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xffdc4d1e),
        title: Text('Generar codigo'),
        actions: <Widget>[],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  //plce where the QR Image will be shown
                  data: qrData,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Generador de codigo QR",
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  controller: qrdataFeed,
                  decoration: InputDecoration(
                    hintText: "Intruduzca los datos a codificar",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: FlatButton(
                    padding: EdgeInsets.all(15.0),
                    onPressed: () async {

                      if (qrdataFeed.text.isEmpty) {        //a little validation for the textfield
                        setState(() {
                          qrData = "";
                        });
                      } else {
                        setState(() {
                          qrData = qrdataFeed.text;
                        });
                      }

                    },
                    child: Text(
                      "Generar QR",
                      style: TextStyle(
                          color: Color(0xffdc4d1e), fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color:  Color(0xffdc4d1e), width: 3.0),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
