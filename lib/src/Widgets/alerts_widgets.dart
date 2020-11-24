import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String tittle;
  final String desc;

  const AlertDialogWidget({
    Key key,
    this.tittle,
    this.desc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(tittle),
        content: Container(
          child: Wrap(
            children: [
              Text(desc),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'aceptar',
              style: TextStyle(color: Color.fromRGBO(0, 181, 161, 1)),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ]);
  }
}
class AlertsDialog extends StatelessWidget {
  const AlertsDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
        title: Text('EN DESARROLLO'),
        content: Container(
          child: Wrap(
            children: [
              Text('Esta vista se encuentra en desarrollo'),
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
      );
}
}
