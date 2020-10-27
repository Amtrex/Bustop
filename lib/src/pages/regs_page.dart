import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:flutter/material.dart';

class RegsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackApp(), 
          Center(
          child: Tittles()
          ),
       
        ],
      ),
    );
  }



  
}
