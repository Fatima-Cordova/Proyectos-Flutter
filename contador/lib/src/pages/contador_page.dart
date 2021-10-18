import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {

  final TextStyle _estiloTexto = new TextStyle(fontSize: 20);
  int _num = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        elevation: 10.0,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Número de Clicks: ', style: _estiloTexto,),
              Text(_num.toString(), style: _estiloTexto,),
            ],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(child: Icon(Icons.add),onPressed: _agregar),
          SizedBox(width: 5.0,),
          FloatingActionButton(child: Icon(Icons.remove),onPressed: _menos ),
          SizedBox(width: 5.0,),
          FloatingActionButton(child: Icon(Icons.exposure_zero),onPressed: _eliminar ),
        ]
    );
  }

  void _agregar() {
    setState(() {
      _num++;
    });
  }

  void _menos() {
    setState(() {
      _num--;
    });
  }

  void _eliminar() {
    setState(() {
      _num = 0;
    });
  }
}