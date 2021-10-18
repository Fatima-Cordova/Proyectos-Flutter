import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      
      lista..add(tempWidget)
           ..add(Divider(color: Colors.black,));

      //lista.add(Divider(color: Colors.black,));
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {

    return opciones.map((item) {
  //  var widgets = opciones.map((item) {

      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.ac_unit_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {

            },
          ),
          Divider()
        ],
      );
    }).toList();

  //  return widgets;
  }


}