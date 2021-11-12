import 'package:sqflite/sqflite.dart';
import 'package:lista_persistencia/src/models/task.dart';


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
    print(await _database!.insert("tasks", task.toMap()));
  }

  Future<List<TaskModel>?> getTodosLosTasks() async {

    List<Map<String, dynamic>> results = await _database!.query("tasks");

    print("Got: ${results.length}");

    return results.map((map) => TaskModel.fromMap(map)).toList();
  }
}