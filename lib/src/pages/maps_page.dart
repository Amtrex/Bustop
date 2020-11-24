import 'dart:async';

import 'package:bustop/src/Widgets/buttons_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  final double _zoom = 17;
  BitmapDescriptor pinLocationIcon;
  Completer<GoogleMapController> _controller = Completer();
  FirebaseAuth auth = FirebaseAuth.instance;
  var locationsDataBase;
  var markLocationBus;
  var markLocationControl;

  var _firebaseRef = FirebaseDatabase().reference().child('location');

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void initState() {
    // Future.delayed(Duration.zero, () {
    //   getData(auth.currentUser.uid);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (origen == null || origen == '') {
      Future.delayed(
        Duration.zero,
        () {
          getData(auth.currentUser.uid);
        },
      );
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(251, 85, 23, 1),
        title: Text("Mapa"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          
          GoogleMap(
            markers: _markers,
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition,
          ),
          Positioned(
            left: -50.0,
            child: ProfileButtonWidget(),
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

  _listenMyLocation(rol, userId) {
    var initial = 0;
    _markers.clear();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        if (initial == 0) {
          _updateCamera(currentLocation.latitude, currentLocation.longitude);
          FirebaseDatabase.instance
              .reference()
              .child('location')
              .child(userId)
              .set({
            'latitude': currentLocation.latitude,
            'longitude': currentLocation.longitude,
            'rol': rol
          });
          _markers.add(
            Marker(
              markerId: MarkerId('myLocation'),
              position:
                  LatLng(currentLocation.latitude, currentLocation.longitude),
              infoWindow: InfoWindow(title: 'location', snippet: 'welcome'),
              icon: pinLocationIcon,
            ),
          );
        }
        origen = LatLng(currentLocation.latitude, currentLocation.longitude);
        _markers.add(
          Marker(
            markerId: MarkerId('myLocation'),
            position:
                LatLng(currentLocation.latitude, currentLocation.longitude),
            infoWindow: InfoWindow(title: 'location', snippet: 'welcome'),
            icon: pinLocationIcon,
          ),
        );
        if (rol != 'usuario') {
          FirebaseDatabase.instance
              .reference()
              .child('location')
              .child(userId)
              .update({
            'latitude': currentLocation.latitude,
            'longitude': currentLocation.longitude,
            'rol': rol
          });
        }
        initial++;
      });
    });
  }

  positionsUsers(userRolLoged) async {
    markLocationBus = (await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/bus.png'));
    markLocationControl = (await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/control.png'));
    _firebaseRef.onValue.listen((event) {
      // _markers.clear();
      var latitude;
      var longitude;
      var role;
      var snapshot = event.snapshot;
      setState(() {
        Map<dynamic, dynamic> map = snapshot.value;
        for (var i = 0; i < map.length; i++) {
          latitude = map.values.toList()[i]["latitude"];
          longitude = map.values.toList()[i]["longitude"];
          role = map.values.toList()[i]["rol"];
          if (userRolLoged != 'conductor') {
            if (role == 'conductor') {
              _markers.add(
                Marker(
                  markerId: MarkerId('newLocation' + i.toString()),
                  position: LatLng(latitude, longitude),
                  infoWindow:
                      InfoWindow(title: role, snippet: 'aca va la ruta'),
                  icon: markLocationBus,
                ),
              );
            }
          }
          if (userRolLoged == 'conductor') {
            if (role == 'control') {
              _markers.add(
                Marker(
                  markerId: MarkerId('newLocation' + i.toString()),
                  position: LatLng(latitude, longitude),
                  infoWindow:
                      InfoWindow(title: 'control', snippet: 'Toma de tiempo'),
                  icon: markLocationControl,
                ),
              );
            }
          }
        }
      });
    });
  }

  Future<void> _updateCamera(lat, lng) async {
    GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), _zoom));
  }

  Future getData(userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('tblUsuarios')
          .where("idUsuario == " + userId + "")
          .get()
          .then((value) async {
        var user = value.docs;
        user.forEach(
          (element) async {
            if (element['idUsuario'] == userId) {
              if (element['rol'] == 'usuario') {
                pinLocationIcon = await BitmapDescriptor.fromAssetImage(
                    ImageConfiguration(devicePixelRatio: 2.5),
                    'assets/userIcon.png');
              }
              if (element['rol'] == 'control') {
                pinLocationIcon = await BitmapDescriptor.fromAssetImage(
                    ImageConfiguration(devicePixelRatio: 2.5),
                    'assets/control.png');
              }
              if (element['rol'] == 'conductor') {
                pinLocationIcon = await BitmapDescriptor.fromAssetImage(
                    ImageConfiguration(devicePixelRatio: 2.5),
                    'assets/bus.png');
              }
              setState(() {
                positionsUsers(element['rol']);
                _listenMyLocation(element['rol'], userId);
              });
            }
          },
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
