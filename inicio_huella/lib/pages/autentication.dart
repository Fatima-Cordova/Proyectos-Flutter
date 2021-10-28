import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:inicio_huella/pages/home_page.dart';
import 'package:local_auth/local_auth.dart';


class AuthPath extends StatefulWidget {

  @override
    _AuthPathState createState() => _AuthPathState();
}


class _AuthPathState extends State<AuthPath> {

  bool? _hasBioSensor;
  LocalAuthentication authentication = LocalAuthentication();

  Future<void> _checkBio() async {
    try {
      _hasBioSensor = await authentication.canCheckBiometrics;
      print(_hasBioSensor);
      if(_hasBioSensor!) {
        _getAuth();
      }
    } on PlatformException catch(e) {
      print(e);
    }
  }

  Future<void> _getAuth() async {
    bool isAuth = false;

    try {
      isAuth = await authentication.authenticate(
          localizedReason: 'Escanea tu huella para ingresar',
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true
      );

      if(isAuth) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomePage()));
      }

      print(isAuth);

    } on PlatformException catch(e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    _checkBio();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("Inicio de Sesión", style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: <Widget>[
                Image.asset('assets/huella.png',
                  width: 150,
                ),
                Text("Autenticación", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          SizedBox(
            width: 250,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  _checkBio();
                },
                elevation: 2.0,
                color: Colors.grey[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 15.0),
                  child: Text("Ingresar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}