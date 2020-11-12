import 'package:bustop/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashBustop extends StatefulWidget {
  @override
 _SplashBustopState createState() => new _SplashBustopState();
}
class _SplashBustopState extends State<SplashBustop> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: ScrollPage(),
      title: Text(
        'Bustop',
        style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset(
          'assets/imgbudtop.gif'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );

  }
}