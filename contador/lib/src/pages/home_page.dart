import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle estiloTexto = new TextStyle(fontSize: 20);
  int num = 10;

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
            Text('Número de Clicks: ', style: estiloTexto,),
            Text(num.toString(), style: estiloTexto,),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          num++;
       //   setSta
        },
      ),
    );
  }
}