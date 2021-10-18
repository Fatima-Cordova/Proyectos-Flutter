import 'package:flutter/material.dart';
import 'dart:core';



class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();

}

class _InputPageState extends State<InputPage> {

  late String _nombre = "";
  late String _email = "";
  late String _fecha;

  String _opcionSeleccionada = "Volar";

  List<String> _poderes = ['Volar', 'Rayos X', 'Correr', 'Invisible'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //  autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          //Aparece arriba del TextField
          helperText: 'Solo nombre',
          suffixIcon: Icon(Icons.accessibility),
          //Aparece abajo del TextField
          icon: Icon(Icons.account_circle_rounded)
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Email',
          labelText: 'Email',
          //Aparece arriba del TextField
          suffixIcon: Icon(Icons.alternate_email),
          //Aparece abajo del TextField
          icon: Icon(Icons.email)
      ),
      onChanged: (valor) {
        setState(() =>
        {
          _email = valor
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          //Aparece arriba del TextField
          suffixIcon: Icon(Icons.lock_open),
          //Aparece abajo del TextField
          icon: Icon(Icons.lock)
      ),
      onChanged: (valor) {
        setState(() =>
        {
          _email = valor
        });
      },
    );
  }



  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          //Aparece arriba del TextField
          suffixIcon: Icon(Icons.perm_contact_calendar),
          //Aparece abajo del TextField
          icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1990),
        lastDate: new DateTime(2050),
        locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }


  List<DropdownMenuItem<String>> getOpcionesDropDown() {

    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }


  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropDown(),
              onChanged: (opt) {
               setState(() {
           // /***************    _opcionSeleccionada = opt;   ***************
                });
              },
            ),
          ),
      ],
    );
  }


  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
