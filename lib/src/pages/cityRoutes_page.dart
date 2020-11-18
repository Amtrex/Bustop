import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliding_card/sliding_card.dart';
class CityRoutesPage extends StatefulWidget {
  const CityRoutesPage({Key key}) : super(key: key);

  @override
  _CityRoutesPageState createState() => _CityRoutesPageState();
}

class _CityRoutesPageState extends State<CityRoutesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          AppBarTittle(
            elev: 4,
            title: 'Rutas de la ciudad',
          ),
          bodypage(),
        ],
      ),
    );
  }

  Future getData() async {
    getRoutes();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List _rutas = [];
  getRoutes() async {
    List array = [];
    await FirebaseFirestore.instance
        .collection("tblRutas")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        array.add({
          'ruta': doc.id,
          'inicio': doc['inicioRuta'],
          'final': doc['finalRuta']
        });
      });
      setState(() {
        _rutas = array;
      });
    });
  }

  Widget bodypage() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(children: createRoutes()),
              ),
              SizedBox(
                height: 3,
              )
            ],
          ),
        )
      ],
    );
  }

  List<Widget> createRoutes() {
    return _rutas.map((rutas) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
              child: Container(
                margin: EdgeInsets.all(9),
                height: 90,
                width: 345,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(251, 83, 13, 1),
                        style: BorderStyle.solid)),
                child: Container(
                  child: ListTile(
                      title: Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomLeft,
                                stops: [
                                  0.0,
                                  0.3,
                                  0.8,
                                  2
                                ],
                                colors: [
                                  Color.fromRGBO(251, 83, 13, 1),
                                  Color.fromRGBO(251, 83, 13, 1),
                                  Colors.orange,
                                  Color.fromRGBO(251, 83, 13, 1),
                                ]),
                            color: Color.fromRGBO(251, 83, 13, 1),
                            borderRadius: BorderRadius.all(Radius.circular(18))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.directions_bus,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              '${rutas['ruta']}'.split(" ")[1],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "SegoeUI",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${rutas['inicio'] + " - " + rutas['final']}'
                                  .toString()
                                  .toUpperCase(),
                              style:  TextStyle(
                                  color:  Color(0xfffb5517),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "SegoeUI",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                            Text('refe'+' - '+'refe'+' - '+'refe', style:  TextStyle(
                                  color:  Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "SegoeUI",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),)
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            onTap: (){
              
            },
          ),
        ],
      );
    }).toList();
  }
}
