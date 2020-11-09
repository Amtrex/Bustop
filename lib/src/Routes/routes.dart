import 'package:bustop/src/Widgets/splash_screen.dart';
import 'package:bustop/src/pages/bus_page.dart';
import 'package:bustop/src/pages/cityRoutes_page.dart';
import 'package:bustop/src/pages/generate.dart';
import 'package:bustop/src/pages/navigationBar.dart';
import 'package:bustop/src/pages/pointController_page.dart';
import 'package:bustop/src/pages/qrPage.dart';
import 'package:bustop/src/pages/register_pages.dart';
import 'package:bustop/src/pages/regs_page.dart';
import 'package:bustop/src/pages/routes_page.dart';
import 'package:bustop/src/pages/scan.dart';
import 'package:bustop/src/pages/time_page.dart';
import 'package:bustop/src/pages/transport_page.dart';
import 'package:flutter/material.dart';
import 'package:bustop/src/pages/login_page.dart';
import 'package:bustop/src/pages/scroll_page.dart';
import 'package:splashscreen/splashscreen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => ScrollPage(),
    'register': (BuildContext context) => RegisterPage(),
    'login': (BuildContext context) => LoginPage(),
    'qr': (BuildContext context) => QrPage(),
    'scan': (BuildContext context) => ScanPage(),
    'generate': (BuildContext context) => GeneratePage(),
    'regs': (BuildContext context) => RegsPage(),
    'nav': (BuildContext context) => NavigationBar(),
    'timePage' : (BuildContext context) => TimePage(),
    'busPage' : (BuildContext context) => BusPage(),
    'routesPage' : (BuildContext context) => RoutesPage(),
    'pointControlPage' : (BuildContext context) => PointControllerPage(),
    'cityRoutesPage' : (BuildContext context) => CityRoutesPage(),
    'transportPage' : (BuildContext context) => TransportPage(),
  
  };
}
