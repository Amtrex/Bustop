import 'package:bustop/src/Widgets/alerts_widgets.dart';
import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/dart2js.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoaging = false;
  bool _check = false;
  bool _showPass = true;
  double _screenHeightSize;
  final _loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  final size = 200.0;

  Widget build(BuildContext context) {
    _screenHeightSize = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackApp(),
        loginPage(),
        Center(
          child: tittles(),
        ),
      ],
    );
  }

  Widget loginPage() {
    const TWO_PI = 3.14 * 2;
    return Container(
      padding: EdgeInsets.only(top: 260),
      // margin: EdgeInsets.only(bottom: 140),
      child: Form(
        key: _loginFormKey,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            inputGradient(
                false, 'Correo', Icon(Icons.person), null, emailController),
            Divider(color: Colors.transparent),
            inputGradient(
                _showPass,
                'Contraseña',
                Icon(Icons.lock),
                IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        if (_showPass == true) {
                          _showPass = false;
                        } else {
                          _showPass = true;
                        }
                      });
                    }),
                passwordController),
            Divider(color: Colors.transparent),
            Text(
              '¿Olvidaste el correo o contraseña?',
              style: TextStyle(color: Colors.grey[400]),
            ),
            Divider(color: Colors.transparent),
            CheckboxListTile(
              //check Remember me
              controlAffinity: ListTileControlAffinity.leading,
              title:
                  Text('Recuerdame', style: TextStyle(color: Colors.grey[400])),
              value: _check,
              activeColor: Colors.orange,
              onChanged: (valor) {
                setState(() {
                  _check = valor;
                });
              },
            ),
            FlatButton(
              //button intro
              textColor: Colors.white,
              // padding: EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(colors: <Color>[
                    Color.fromRGBO(251, 85, 23, 1),
                    Color.fromRGBO(255, 138, 82, 1),
                  ]),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                child: Text('Ingresar'),
              ),
              onPressed: () {
                isLoaging = true;
                if (_loginFormKey.currentState.validate()) {
                  setState(() {
                    _authFirebase();
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: Duration(seconds: 4),
                            builder: (context, value, child) {
                              int percentage = (value * 100).ceil();
                              return Container(
                                width: size,
                                height: size,
                                child: Stack(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (rect) {
                                        return SweepGradient(
                                            startAngle: 0.0,
                                            endAngle: TWO_PI,
                                            stops: [value, value],
                                            // 0.0 , 0.5 , 0.5 , 1.0
                                            center: Alignment.center,
                                            colors: [
                                              Colors.white,
                                              Colors.transparent.withAlpha(55)
                                            ]).createShader(rect);
                                      },
                                      child: Container(
                                        width: size,
                                        height: size,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/IconBustop.png"))),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width: size - 40,
                                        height: size - 40,
                                        // decoration: BoxDecoration(
                                        //     color: Colors.white,
                                        //     shape: BoxShape.circle
                                        // ),
                                        child: Center(
                                            child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 125,
                                            ),
                                            Text(
                                              "$percentage" + "%",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Aun no tienes una cuenta?",
                    style: TextStyle(color: Colors.grey[400])),
                GestureDetector(
                  child: Text("Registrate",
                      style: TextStyle(color: Color.fromRGBO(251, 85, 23, 1))),
                  onTap: () {
                    Navigator.pushNamed(context, 'register');
                  },
                )
              ],
            ),
            SizedBox(
              height: 400,
            ),
          ],
        ),
      ),
    );
  }

  Future _authFirebase() async {
    var email = emailController.text.trim();
    var pass = passwordController.text.trim();
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: pass,
      )
          .then((value) {
        get_data(value.user.uid);
      }).catchError((e) {
        if (e.code == 'user-not-found') {
          return showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
                tittle: 'Usuario no encontrado',
                desc:
                    'El usuario no se encuentra registrado en la base de datos.'),
          );
        } else if (e.code == 'wrong-password') {
          return showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
                tittle: 'Contraseña incorrecta',
                desc:
                    'La contraseña que digitaste es erronea, intenta digitarla nuevaente.'),
          );
        } else if (e.code == 'invalid-email') {
          return showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
                tittle: 'Correo incorrecto',
                desc:
                    'El correo que digitaste es erroneo, intenta digitarlo nuevaente.'),
          );
        } else {
          print(e.message);
          return e.message;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future get_data(user_id) async {
    var roles;
    try {
      var usuario = (await FirebaseFirestore.instance
          .collection('tblUsuarios')
          .where("idUsuario == '" + user_id + "'")
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if (element['idUsuario'] == user_id) {
            if (element['rol'] == 'administrador' ||
                element['rol'] == 'control' ||
                element['rol'] == 'conductor' ||
                element['rol'] == 'usuario') {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'nav', arguments: element['rol']);
            } else {
              Navigator.of(context).pop();
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text('En desarrollo'),
                        content: Container(
                          child: Wrap(
                            children: [
                              Text('Proximamente podras ingresar a este rol'),
                              Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Color.fromRGBO(251, 85, 23, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              'aceptar',
                              style: TextStyle(
                                  color: Color.fromRGBO(251, 85, 23, 1)),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ]);
                  });
            }
          }
        });
      }));
    } catch (e) {
      print(e);
    }
  }

  Widget inputGradient(
      _showPass, String title, Widget pfx, Widget sfx, final ctr) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey[200],
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(251, 85, 23, 1),
              Color.fromRGBO(255, 138, 82, 1),
            ],
          ),
        ),
        child: TextFormField(
          //User field
          obscureText: _showPass,
          controller: ctr,
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor digiligencie este campo';
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
              borderSide: BorderSide.none,
            ),
            hintText: title,
            prefixIcon: pfx,
            suffixIcon: sfx,
          ),
        ),
      ),
    );
  }

  Widget tittles() {
    return Container(
        padding: EdgeInsets.all(60.0),
        child: Column(
          children: <Widget>[image(), desc()],
        ));
  }

  Widget image() {
    return Image(
      image: AssetImage('assets/logoW.png'),
      height: 120,
      width: 120,
    );
  }

  Widget desc() {
    return Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ingresar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
