import 'package:flutter/material.dart';



class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () =>
            _mostrarAlert(context),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: StadiumBorder()
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon (Icons.arrow_back_ios_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Título'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Contenido de la alerta Contenido de la alerta'),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed:() => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed:() {
                  Navigator.of(context).pop();
                }
              ),
            ],
          );
        }
    );
  }
}