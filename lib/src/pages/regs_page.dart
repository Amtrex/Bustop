import 'package:bustop/src/Widgets/alerts_widgets.dart';
import 'package:bustop/src/Widgets/styleWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegsPage extends StatefulWidget {
  @override
  _RegsPageState createState() => _RegsPageState();
}

class _RegsPageState extends State<RegsPage> {
  String _today = new DateTime.now().toString();
  bool _showPass = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('tblUsuarios');

  final _formKey = GlobalKey<FormState>();
  
  Future getDataDropdowns() async {
    getDocumentType();
    getAllRols();
  }
var _select;
  var _rolS;
  List _documentsType = [];
  getDocumentType() async {
    List array = [];
    await FirebaseFirestore.instance
        .collection('tblDocumentos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        array.add({'nombre': doc.data()['nombre']});
      });
      setState(() {
        _documentsType = array;
      });
    });
  }

  List _roles = [];
  getAllRols() async {
    List array = [];
    await FirebaseFirestore.instance
        .collection('tblRoles')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        array.add({'nombre': doc.data()['nombre']});
      });
      setState(() {
        _roles = array;
      });
    });
  }

  String _name;
  final nameController = TextEditingController();
  String _lastName;
  final lastnameController = TextEditingController();
  String _indentificationNumber;
  final indentificationNumberController = TextEditingController();
  int _movilNumber;
  final movilNumberController = TextEditingController();
  String _email;
  final emailController = TextEditingController();
  int _companyCode;
  final companyCodeController = TextEditingController();
  String _password;
  final passwordController = TextEditingController();
  String _confirmPassword;
  final confirmPasswordController = TextEditingController();
  var imageFile;

  void initState() {
    getDataDropdowns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackApp(),
          Center(
            child: Tittles(),
          ),
          formRegistry(),
        ],
      ),
    );
  }

  Widget formRegistry() {
    return Form(
      key: _formKey,
      child: Container(
        //Container form
        margin: EdgeInsetsDirectional.only(top: 260.0),
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  //Name
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Nombres',
                    labelText: 'Nombres',
                  ),
                  // autovalidate: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor digiligencie este campo';
                    }
                  },
                ),
                TextFormField(
                  //Last name
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outline),
                    hintText: 'Apellidos',
                    labelText: 'Apellidos',
                  ),
                  controller: lastnameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor digiligencie este campo';
                    }
                  },
                ),
                Row(
                  //Identification type
                  children: <Widget>[
                    Icon(Icons.recent_actors),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: DropdownButton(
                        hint: Text('Tipo de documento'),
                        value: _select,
                        items: _documentsType
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e['nombre']),
                                ))
                            .toList(),
                        onChanged: (opt) {
                          setState(() {
                            _select = opt;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  //Document type
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.portrait),
                    hintText: 'Numero de documento',
                    labelText: 'Numero de documento',
                  ),
                  controller: indentificationNumberController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor digiligencie este campo';
                    }
                  },
                ),
                TextFormField(
                  //movil number
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.call),
                    hintText: 'Numero de celular',
                    labelText: 'Numero de celular',
                  ),
                  controller: movilNumberController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor digiligencie este campo';
                    }
                  },
                ),
                TextFormField(
                  //Email address
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Correo electronico',
                    labelText: 'Correo electronico',
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor digiligencie este campo';
                    }
                  },
                ),
                Row(
                  //Rol
                  children: <Widget>[
                    Icon(Icons.recent_actors),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: DropdownButton(
                        hint: Text('Rol'),
                        value: _rolS,
                        items: _roles
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e['nombre']),
                                ))
                            .toList(),
                        onChanged: (opt) {
                          setState(() {
                            _rolS = opt;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  //Password
                  obscureText: _showPass,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    suffixIcon: visibility(),
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor digiligencie este campo';
                    }
                  },
                ),
                TextFormField(
                  //Confirm password
                  obscureText: _showPass,
                  decoration: InputDecoration(
                    suffixIcon: visibility(),
                    icon: Icon(Icons.lock_outline),
                    hintText: 'Confirmar contraseña',
                    labelText: 'Cofirmar contraseña',
                  ),
                  controller: confirmPasswordController,
                  autovalidate: true,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                  },
                ),
                Divider(
                  color: Colors.transparent,
                ),
                FlatButton(
                  //button intro
                  textColor: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(colors: [
                         Color.fromRGBO(251, 85, 23, 1),
                    Color.fromRGBO(255, 138, 82, 1),
                      ]),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 7.0),
                    child: Text('Crear'),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _name = nameController.text;
                        _lastName = lastnameController.text;
                        _indentificationNumber =
                            indentificationNumberController.text;
                        _movilNumber = int.parse(movilNumberController.text);
                        _email = emailController.text;
                        _companyCode = int.parse(companyCodeController.text);
                        createUserWithEmailAndPassword();
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                      });
                    } else {
                      AlertDialog(title: Text('.l.'));
                    }
                  },
                ),
                Divider(
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: _email,
        password: passwordController.text,
      ).then((user){
        addUser(user);
      })
          .catchError(
        (e) {
          Navigator.of(context).pop();
          return showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
                tittle: 'Error!',
                desc: 'El correo electronico se encuentra registrado.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> addUser(userId) async {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'user_id': userId,
      'name': _name != '' || _name != null ? _name : '', // John Doe
      'lastname':
          lastnameController.text != '' || lastnameController.text != null
              ? _lastName
              : '', // Stokes and Sons
      'document_type': _select['nombre'], // 42
      'document_number': indentificationNumberController.text,
      'movil': movilNumberController.text,
      'email': emailController.text,
      'rol': _rolS['nombre'],
      'state': 1
    }).then((value) {
      Navigator.of(context).pop();
      return showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
          tittle: 'Creado!',
          desc: 'El usuario se ha registrado con exito.',
        ),
      );
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (BuildContext context) =>));
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Widget visibility() {
    return IconButton(
        icon: Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            if (_showPass == true) {
              _showPass = false;
            } else {
              _showPass = true;
            }
          });
        });
  }
}
