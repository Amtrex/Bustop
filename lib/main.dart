import 'package:bustop/src/pages/home_page.dart';
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bustop',
      initialRoute: '/',
      routes: {
        // '/'         : (BuildContext context)=>HomePage(),
        '/'   : (BuildContext context)=>ScrollPage(),
      },
    );
  }
}