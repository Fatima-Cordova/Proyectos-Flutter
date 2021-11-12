import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnecion {

  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "databaselist");
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDatabase
    );

    return database;
  }

  _onCreateDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");

    //Tabla de toda la lista
    await database.execute
      ("CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT, category TEXT, date TEXT, finished INTEGER)");

  }
}