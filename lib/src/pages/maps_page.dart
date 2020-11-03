import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:qrcode/generate.dart';
//import 'package:qrcode/scan.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Location location = Location();
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(26.8206, 30.8025));
  var origen;
  final Set<Marker> _markers = Set();
  final double _zoom = 15;

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void initState() {
    // Future.delayed(Duration.zero, () {
    //   _listenLocation();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (origen == null || origen == '') {
      Future.delayed(Duration.zero, () => _listenMyLocation());
    }
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
            markers: _markers,
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

  Future<void> _listenMyLocation() async {
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        origen = LatLng(currentLocation.latitude, currentLocation.longitude);
        _updateCamera(currentLocation.latitude, currentLocation.longitude);
        _markers.clear();
        _markers.add(
          Marker(
              markerId: MarkerId('myLocation'),
              position:
                  LatLng(currentLocation.latitude, currentLocation.longitude),
              infoWindow: InfoWindow(title: 'location', snippet: 'welcome')),
        );
      });
    });
  }

  Future<void> _AddMarks() async{
  }

  Future<void> _updateCamera(lat, lng) async {
    GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), _zoom));
  }
}
