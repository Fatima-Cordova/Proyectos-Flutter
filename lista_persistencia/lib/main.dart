import 'package:flutter/material.dart';
import 'package:lista_persistencia/src/pages/auth_page.dart';
import 'package:lista_persistencia/src/pages/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Persistencia',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[200]
        ),
        home: HomePage()
    );
  }
}