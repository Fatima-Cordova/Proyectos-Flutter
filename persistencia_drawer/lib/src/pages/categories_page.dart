import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistencia_drawer/src/encrypt/encrypt_decrypt.dart';
import 'package:persistencia_drawer/src/models/category.dart';
import 'package:persistencia_drawer/src/pages/home_page.dart';
import 'package:persistencia_drawer/src/services/category_services.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';


class CategoriesPage extends StatefulWidget {

  @override
  _CategoriesPageState createState() => _CategoriesPageState();

}

class _CategoriesPageState extends State<CategoriesPage>{

  TextEditingController _categoryName = TextEditingController();

  //var _categoryName = TextEditingController();
  var _categoryDescription = TextEditingController();

  var _category = Category();
  var _categoryServices = CategoryServices();

  List<Category> _categoryList = <Category>[];

  var category;
 // var encryptedText;

  var _editCategoryName = TextEditingController();
  var _editCategoryDescription = TextEditingController();


  var key = "null";
  String? encrypt;

  var text = "null";



  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
        appBar: AppBar(
          leading: ElevatedButton(
            child: Icon(Icons.arrow_back,),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              elevation: 0.0,
            ),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: Text("Categorías"),
        ),
      body: ListView.builder(
        itemCount: _categoryList.length,
          itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 5.0,
                child: ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editCategory(context, _categoryList[index].id);
                      }),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_categoryList[index].name!),
                      IconButton(
                          onPressed: () {
                            _deleteDialog(context, _categoryList[index].id);
                          },
                          icon: Icon(Icons.delete, color: Colors.red,)
                      )
                    ],
                  ),
                //  subtitle: Text(_categoryList[index].description!),
                ),
              ),
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialog(BuildContext context) {

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.white
              ),
              onPressed: () => Navigator.pop(context)
            ),
            TextButton(
              child: Text('Guardar'),
              style: TextButton.styleFrom(backgroundColor: Colors.blue, primary: Colors.white),
              onPressed: () async {

                _category.name = _categoryName.text;
                _category.description = _categoryDescription.text;

              //  _category.name = EncryptAndDecrypt.encryptAES(_categoryName.text);


                _categoryName.clear();
                _categoryDescription.clear();


             //   _category = EncryptDecrypt.encryptAES(_category);

               var result = await _categoryServices.saveCategory(_category);
                if (result > 0)  {

               //   result = _category.name;
               //   result = _category.description;
                  result = EncryptAndDecrypt.encryptAES(_category.name);
                  result = EncryptAndDecrypt.encryptAES(_category.description);
                  print(result);
                  Navigator.pop(context);
                  getAllCategories();

                  var decrypt =   EncryptAndDecrypt.decryptAES(result);
                  print(decrypt);
                }


              },
            )
          ],
          title: Text('Categorías'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _categoryName,
                  decoration: InputDecoration(
                      labelText: 'Categoría',
                  ),
                ),
                TextField(
                  controller: _categoryDescription,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                  ),
                )
              ],
            ),
          ),
        );
      });
  }


  _editDialog(BuildContext context) {

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red, primary: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue, primary: Colors.white),
                onPressed: () async {
                  _category.id = category[0]['id'];
                  _category.name = _editCategoryName.text;
                  _category.description = _editCategoryDescription.text;

                  var result = await _categoryServices.updateCategory(_category);
                  if(result > 0) {
                    result = EncryptAndDecrypt.encryptAES(_category.name);
                    result = EncryptAndDecrypt.encryptAES(_category.description);
                    Navigator.pop(context);
                    getAllCategories();

                    var decrypt =   EncryptAndDecrypt.decryptAES(result);
                    print(decrypt);

                    _showSuccessSnackBar(Text('Actualizado'));
                  }
                },
                child: Text('Actualizar'),
              )
            ],
            title: Text('Editar categoría'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _editCategoryName,
                    decoration: InputDecoration(
                      labelText: 'Categoría',
                    ),
                  ),
                  TextField(
                    controller: _editCategoryDescription,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }


  _deleteDialog(BuildContext context, categoryId) {

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red, primary: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue, primary: Colors.white),
                onPressed: () async {

                  var result = await _categoryServices.deleteCategory(categoryId);
                  if(result > 0) {
                    Navigator.pop(context);
                    getAllCategories();
                    _showSuccessSnackBar(Text('Nota eliminada'));
                  }
                },
                child: Text('Eliminar'),
              )
            ],
            title: Text('¿Estás seguro de eliminar esta nota?'),
          );
        });
  }


  getAllCategories() async {
    _categoryList = <Category>[];
    var categories = await _categoryServices.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.id = category['id'];
        _categoryList.add(categoryModel);
      });
    });
  }


  _editCategory(BuildContext context, categoryId) async {
    category = await _categoryServices.readCategoryById(categoryId);
    setState(() {
      _editCategoryName.text = category[0]['name']?? 'Sin Nombre';
      _editCategoryDescription.text = category[0]['description']?? 'Sin Descripcion';
    });
    _editDialog(context);
  }


  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState!.showSnackBar(_snackBar);
  }

}