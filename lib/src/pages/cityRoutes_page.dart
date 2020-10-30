import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:flutter/material.dart';
class CityRoutesPage extends StatelessWidget {
  const CityRoutesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBarTittle(
        title: 'Rutas de la ciudad',
      ),
    );
  }
}