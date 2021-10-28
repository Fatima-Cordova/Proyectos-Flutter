import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inicio_huella/pages/autentication.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inicio',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[200]
          //backgroundColor: Colors.deepOrange[200],
        ),
        home: AuthPath()
    );
  }
}
