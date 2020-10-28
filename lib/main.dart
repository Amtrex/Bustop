import 'package:bustop/src/Routes/routes.dart';
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