import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:persistencia1/src/pages/home_page.dart';


class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{

    bool? _sensorBiometric;
    LocalAuthentication authentication = LocalAuthentication();


    Future<void> _checkSensor() async {
      try {
        _sensorBiometric = await authentication.canCheckBiometrics;

        if(_sensorBiometric!) {
          _getAuthentication();
        }
      } on PlatformException catch(e) {
        print(e);
      }
    }

    Future<void> _getAuthentication() async {
      bool isAuthenticated = false;

      try {
        isAuthenticated = await authentication.authenticate(
            localizedReason: "Escanea tu huella para ingresar",
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: true
        );

        if(isAuthenticated) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomePage()));
        }
      } on PlatformException catch(e) {
        print(e);
      }
    }

    @override
    void initState() {
      super.initState();
      _checkSensor();
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
                    _checkSensor();
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

