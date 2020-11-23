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
    return Container(

      child: Stack(
        children: [
          AppBarTittle(
            title: 'Mis tiempos',
          ),

          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: Text('mis tiempos'),
            ),

            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(             
                  children:<Widget>[
                    
                  ]
                ),
              ),
            )
                  
          )
        ],
      ),
    );
  }
}
