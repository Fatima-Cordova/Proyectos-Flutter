import 'dart:io';

import 'package:path/path.dart';
import 'package:persistencia1/src/models/task.dart';
import 'package:sqflite/sqflite.dart';


class DBProvider {

  Database? _database ;

  initDB() async {
    _database = await openDatabase (
      'database.db',
      version: 1,
      onCreate: (Database? database, int version) {
      database!.execute(
          "CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT NOT NULL);");
      },
    );
    print("BD inicializada");
  }

  insert(TaskModel task) async {
    _database!.insert("tasks", task.toMap());
  }

  Future<List<TaskModel>?> getTodosLosTasks() async {

    List<Map<String, dynamic>> results = await _database!.query("tasks");

    print("Got: ${results.length}");

    return results.map((map) => TaskModel.fromMap(map)).toList();
  }
}