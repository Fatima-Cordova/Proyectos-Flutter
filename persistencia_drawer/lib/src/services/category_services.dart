import 'package:persistencia_drawer/src/models/category.dart';
import 'package:persistencia_drawer/src/repositories/repository.dart';


class CategoryServices {

  Repository? _repository;

  CategoryServices() {
    _repository = Repository();
  }


  saveCategory(Category category) async {
    return await _repository!.insertData('categories', category.categoryMap());
  }


  readCategories() async{
    return await _repository!.readData('categories');
  }

  //Leer datos de la tabla por id
  readCategoryById(categoryId) async {
    return await _repository!.readDataById('categories', categoryId);
  }

  //Actualizando datos de la tabla
  updateCategory(Category category) async{
    return await _repository!.updateData('categories', category.categoryMap());
  }


  //Eliminar nota de la tabla
  deleteCategory(categoryId) async{
    return await _repository!.deleteData('categories', categoryId);
  }
}
