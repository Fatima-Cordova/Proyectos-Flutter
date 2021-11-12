import 'dart:core';
import 'package:flutter/material.dart';
import 'package:lista_persistencia/src/helpers/drawer_navigation.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis anotaciones"),
      ),
      drawer: NavigationDrawer()
    );
  }
}
