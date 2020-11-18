import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatefulWidget {
  final rol;
  ProfileButtonWidget({Key key, this.rol}) : super(key: key);

  @override
  _ProfileButtonWidgetState createState() => _ProfileButtonWidgetState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
var uid;
var email;
 var user;
class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
 
  Future getUser() async {
    await FirebaseFirestore.instance
        .collection('tblUsuarios')
        .where("idUsuario", isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['idUsuario'] == uid) {
          user = doc['nomUsuario'];
        }
      });
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    if (uid == null || uid == '') {
      uid = auth.currentUser.uid;
      email = auth.currentUser.email;
      Future.delayed(
        Duration.zero,
        () {
          setState(() {
            getUser();
          });
          
        },
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: FloatingActionButton(
              child: Icon(
                Icons.account_circle_outlined,
                size: 50,
                color: Color.fromRGBO(251, 83, 13, 1),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                _showDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Container(
              child: Column(
            children: [
              CircleAvatar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user[0],
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                maxRadius: 80,
                backgroundColor: Color.fromRGBO(251, 83, 13, 1),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          )),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Estas logeado como: "),
              Text(user,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Cancelar",
                style: TextStyle(color: Color.fromRGBO(251, 83, 13, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text(
                "Cerrar Sesion",
                style: TextStyle(color: Color.fromRGBO(251, 83, 13, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
