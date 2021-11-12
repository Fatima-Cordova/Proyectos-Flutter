import 'package:persistencia_drawer/src/models/listafecha.dart';
import 'package:persistencia_drawer/src/repositories/repository.dart';



class ListaService {

  Repository? _repository;

  ListaService() {
    _repository = Repository();
  }

  saveList(ListaFecha listaFecha) async {
    return await _repository!.insertData('todos', listaFecha.todoMap());
  }


  //Leer la lista
  readList() async {
    return await _repository!.readData('todos');
  }
}