import 'package:bustop/src/Routes/routes.dart';
import 'package:bustop/src/pages/Register_pages.dart';
import 'package:bustop/src/pages/generate.dart';
import 'package:bustop/src/pages/home_page.dart';
import 'package:bustop/src/pages/login_page.dart';
import 'package:bustop/src/pages/qrpage.dart';
import 'package:bustop/src/pages/scan.dart';
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
  }
 
class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
));
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
  ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bustop',
      initialRoute: '/',
      routes: getAplicationRoutes()
    );
  }
}