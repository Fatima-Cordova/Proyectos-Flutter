import 'package:flutter/material.dart';

import 'package:persistencia1/src/models/task.dart';
import 'package:persistencia1/src/providers/db_provider.dart';

class HomePage extends StatefulWidget {

  @override
    _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  DBProvider database = DBProvider();
 // List<String> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis anotaciones"),
      ),
      body: FutureBuilder(
        future: database.initDB(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return _showList(context);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _showList(BuildContext context) {
    return FutureBuilder(
      future: database.getTodosLosTasks(),
      initialData: <TaskModel>[],
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData) {
          return ListView(
            children: <Widget>[
              for(TaskModel task in snapshot.data) ListTile(title: Text(task.name),)
            ],
          );
        } else {
          return Center(
            child: Text("Agregar tareas..!!"),
          );
        }
      },
    );
  }

  _addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(icon: Icon(Icons.add_circle)),
                onSubmitted: (text) {
                 setState(() {
                  // var task = TaskModel(text);
                  // database.insert(task);
                   Navigator.pop(context);
                 });
                }
              )
            ],
          );
        }
    );
  }
}

