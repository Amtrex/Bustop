import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:qrcode/generate.dart';
//import 'package:qrcode/scan.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

CameraPosition _initialPosition =
    CameraPosition(target: LatLng(26.8206, 30.8025));
Completer<GoogleMapController> _controller = Completer();

void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251, 85, 23, 1),
        title: Text("Geolocalización"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition,
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
        style: TextStyle(
            color: Color.fromRGBO(251, 85, 23, 1), fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(251, 85, 23, 1), width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
