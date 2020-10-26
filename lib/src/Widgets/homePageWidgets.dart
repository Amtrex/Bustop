import 'dart:ui';

import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:flutter/material.dart';
class CircleBottoms extends StatelessWidget {
  const CircleBottoms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          CreateCircleBottoms(),
          CreateCircleBottoms(),
        ]),
        TableRow(children: [
          CreateCircleBottoms(),
          CreateCircleBottoms(),
        ]),
        TableRow(children: [
          CreateCircleBottoms(),
          CreateCircleBottoms(),
        ]),
      ],
    );
  }
}

class CreateCircleBottoms extends StatelessWidget {
  const CreateCircleBottoms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          height: 140,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(245, 148, 115, 0.70),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(251, 85, 23, 1),
                radius: 35.0,
                child: Icon(
                  Icons.card_membership,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Text(
                'Obj',
                style: TextStyle(color: Color.fromRGBO(251, 85, 23, 1)),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
  Widget HomePage() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackApp(),
          ListView(
            children: <Widget>[TittlesBack(), CircleBottoms()],
          )
        ],
      ),
    );
  }
  class TittlesBack extends StatelessWidget {
  const TittlesBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            ImageBack(),
          ],
        ));
  }
}

class ImageBack extends StatelessWidget {
  const ImageBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/logoW.png'),
      height: 120,
      width: 120,
    );
  }
}
class AlertsDialog extends StatelessWidget {
  const AlertsDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
        title: Text('EN DESARROLLO'),
        content: Container(
          child: Wrap(
            children: [
              Text('Esta vista se encuentra en desarrollo'),
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(251, 85, 23, 1)),
                ),
              ),
            ],
          ),
        ),
      );
}
}