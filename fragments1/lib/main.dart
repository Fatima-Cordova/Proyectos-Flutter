import 'package:flutter/material.dart';
import 'package:fragments1/src/pages/home_page.dart';

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
          primarySwatch: Colors.teal,
      //      scaffoldBackgroundColor: Colors.blueGrey[700]
        ),
        home: HomePage()
    );
  }
}