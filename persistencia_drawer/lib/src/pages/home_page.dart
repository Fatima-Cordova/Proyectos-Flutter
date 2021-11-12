import 'dart:core';
import 'package:flutter/material.dart';
import 'package:persistencia_drawer/src/models/listafecha.dart';
import 'package:persistencia_drawer/src/pages/menu_page.dart';
import 'package:persistencia_drawer/src/services/lista_services.dart';
import 'package:persistencia_drawer/src/utils/drawer_navigation.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  ListaService? _listaService;

  List<ListaFecha> _listFecha = <ListaFecha>[];

  @override
  void initState() {
    super.initState();
    getAllList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mis anotaciones"),
        ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
          itemCount: _listFecha.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0)
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_listFecha[index].title ?? 'Sin título'),
                    ],
                  ),
                  subtitle: Text(_listFecha[index].description ?? 'Sin categpría'),
                  trailing: Text(_listFecha[index].date ?? 'Sin fecha '),
                ),
              ),
            );
          }
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage())),
        child: Icon(Icons.add),
      ),
    );
  }

  getAllList() async {
    _listaService = ListaService();
    _listFecha = <ListaFecha>[];

    var lists = await _listaService!.readList();

    lists.forEach((list) {
      setState(() {
        var model = ListaFecha();
        model.id = list['id'];
        model.title = list['title'];
        model.description = list['description'];
        model.category = list['category'];
        model.date = list['date'];
        model.finished = list['finished'];
        _listFecha.add(model);
      });
    });
  }
}

