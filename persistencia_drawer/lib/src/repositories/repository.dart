

import 'package:persistencia_drawer/src/services/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnecion? _databaseConnecion;

  Repository()  {
    //Inicia conexión de base de datos
    _databaseConnecion = DatabaseConnecion();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null)
      return _database;

    _database = await _databaseConnecion!.setDatabase();
    return _database;
  }

  //insertando datos a la tabla
  insertData(table, data) async{
    var connection = await database;
    return await connection!.insert(table, data);
  }

  //Leer datos de la tabla
  readData(table) async {
    var connection = await database;
    return await connection!.query(table);
  }

  //Leer tados de la tabla por id
  readDataById(String table, itemId) async {
    var connection = await database;
    return await connection!.query(table, where: 'id=?', whereArgs: [itemId]) ;
  }

  //Actualizar datos de la tabla
  updateData(table, data) async {
    var connection = await database;
    return await connection!.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Eliminando datos de la tabla
  deleteData(table, itemId) async {
    var connection = await database;
    return await connection!.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

}