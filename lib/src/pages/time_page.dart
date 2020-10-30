import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  TimePage({Key key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return AppBarTittle(
      title: 'Mis tiempos',
    );
  }
}
