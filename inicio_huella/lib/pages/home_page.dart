import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Pagina 2'),
        ),
      body: Center(
        child: Text('Bienvenido a la página 2'),
      ),
    );
  }
}