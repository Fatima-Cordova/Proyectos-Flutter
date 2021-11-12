import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistencia_drawer/src/models/listafecha.dart';
import 'package:persistencia_drawer/src/services/category_services.dart';

import 'package:intl/intl.dart';
import 'package:persistencia_drawer/src/services/lista_services.dart';



class MenuPage extends StatefulWidget {

  _MenuPageState createState() => _MenuPageState();

}

class _MenuPageState extends State<MenuPage> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _dateController = TextEditingController();

  var _selectedValue;

  var _categories ; // = List<DropdownMenuItem>()

  DateTime _dateTime = DateTime.now();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Toda la lista'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:  Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'Titulo'
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  labelText: 'Descripcion'
              ),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Fecha',
                prefixIcon: InkWell(
                  onTap: () {
                    _selectedDateTime(context);
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ),
            ),
            DropdownButtonFormField(
              value: _selectedValue,
              items: _categories,
              hint: Text('Categoría'),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async{
                var listaObjetc = ListaFecha();

                listaObjetc.title = _dateController.text;
                listaObjetc.description = _descriptionController.text;
                listaObjetc.finished = 0;
                listaObjetc.category = _selectedValue.toString();
                listaObjetc.date = _dateController.text;

                var _listaService = ListaService();
                var result = await _listaService.saveList(listaObjetc);

                if(result>0) {
                  _showSuccessSnackBar(Text('Nota guardada'));
                }

              },
              child: Text('Guardar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      )
    );
  }

  _loadCategories() async {
    var _categoryService = CategoryServices();
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category['name']),
          value: category['name'],
        ));
      });
    });
  }

  _selectedDateTime(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1960),
        lastDate: DateTime(2100));

    if(_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState!.showSnackBar(_snackBar);
  }

}