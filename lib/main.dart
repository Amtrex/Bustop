import 'package:bustop/src/pages/Register_pages.dart';
import 'package:bustop/src/pages/generate.dart';
import 'package:bustop/src/pages/home_page.dart';
import 'package:bustop/src/pages/login_page.dart';
import 'package:bustop/src/pages/qrpage.dart';
import 'package:bustop/src/pages/scan.dart';
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
 
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
  ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bustop',
      initialRoute: '/',
      routes: {
        '/'   : (BuildContext context)=>ScrollPage(),
        'home': (BuildContext context)=>HomePage(),
        'register':(BuildContext context)=>RegisterPage(), 
        'login' :(BuildContext context)=>LoginPage(),
        'qr' :(BuildContext context)=>QrPage(),
        'scan':(BuildContext context)=>ScanPage(),
        'generate':(BuildContext context)=>GeneratePage(),
      },
    );
  }
}