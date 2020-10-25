import 'package:bustop/src/pages/generate.dart';
import 'package:bustop/src/pages/home_page.dart';
import 'package:bustop/src/pages/loginPage.dart';
import 'package:bustop/src/pages/qrPage.dart';
import 'package:bustop/src/pages/register_pages.dart';
import 'package:bustop/src/pages/scan.dart';
import 'package:flutter/material.dart';
import 'package:bustop/src/pages/login_page.dart';
import 'package:bustop/src/pages/scroll_page.dart';


Map <String, WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
    '/'   : (BuildContext context)=>ScrollPage(),
        'home': (BuildContext context)=>HomePage(),
        'register':(BuildContext context)=>RegisterPage(), 
        'login' :(BuildContext context)=>LoginPage(),
        'qr' :(BuildContext context)=>QrPage(),
        'scan':(BuildContext context)=>ScanPage(),
        'generate':(BuildContext context)=>GeneratePage(),
        'logins' :(BuildContext context)=>LoginPages(),
  };
}