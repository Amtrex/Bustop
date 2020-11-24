import 'dart:ui';
import 'package:flutter/material.dart';
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
