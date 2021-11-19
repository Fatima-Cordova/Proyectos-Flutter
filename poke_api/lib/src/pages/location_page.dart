import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_api/src/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/src/pages/home_page.dart';

class LocationPage extends StatefulWidget {

  final pepitoPapas;
  final areaTag;

  const LocationPage({Key? key, this.pepitoPapas, this.areaTag}) : super(key: key);


  @override
  _LocationPageScreen createState() => _LocationPageScreen();

}

class _LocationPageScreen extends State<LocationPage> {


  late List areasList;
  HomePage? locationList;


  @override
  void initState() {
    super.initState();
    if(mounted) {
      _getAreas();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Areas"),
      ),
      body: _areasList(),
    );
  }

  Widget _areasList() {

    return Scaffold(
      body: Column(
        children: [
          areasList != null ?Expanded(
            child: ListView.builder(
              itemCount: areasList.length,
              itemBuilder: (context, index) {
                //  var areas = locationList[index]['url'][1];
                return InkWell(
                  child: Padding(
                    padding: const  EdgeInsets.symmetric(vertical: 9.0, horizontal: 3.0),
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child:  Text(
                                    areasList[index]['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),

                );
              },
            ),
          ):
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      )

    );
  }

  void _getAreas() {
    var areasResponse = Uri.parse('https://pokeapi.co/api/v2/location/' + widget.pepitoPapas);

    http.get(areasResponse).then((value) {
      if(value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        areasList = decodedJsonData['areas'];
        setState(() {
        });
        print(areasList[1]['name']);
      }
    });
  }
}
