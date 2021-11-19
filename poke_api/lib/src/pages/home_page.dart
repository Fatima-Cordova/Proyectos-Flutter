import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_api/src/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/src/pages/location_page.dart';


class HomePage extends StatefulWidget {

  final areaPage;
  final locationTag;

  const HomePage({Key? key, this.areaPage, this.locationTag}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  late Location locationUbi;
  late List locationList;
  late List areasList;
  late Future<List<Location>?> _listLocation;
  var response = Uri.parse('https://pokeapi.co/api/v2/location/');

  @override
  void initState() {
    super.initState();
    if(mounted) {
      _getLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PokeApi"),
        ),
        body: _list()
    );
  }

  Future _getLocation() async{

    http.get(response).then((value) {
      if(value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        locationList = decodedJsonData['results'];
        setState(() {

        });
        //print(locationList[0]["results"]);
      }
    });
  }

   Widget _list() {

   return Scaffold(
     body: Column(
       children: [
         locationList != null ? Expanded(
             child: ListView.builder(
               itemCount: locationList.length,
               itemBuilder: (context, index) {
               //  var areas = locationList[index]['url'][1];
                 return InkWell(
                     child: Padding(
                       padding: const  EdgeInsets.symmetric(vertical: 9.0, horizontal: 3.0),
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(20)),
                         ),
                         child: Stack(
                           children: [
                             Positioned(
                                 child: Container(
                                   child: Padding(
                                     padding: const EdgeInsets.all(9.0),
                                     child:  Text(
                                       locationList[index]['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                     ),
                                   ),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.all(Radius.circular(25))
                                   ),
                                 )
                             ),
                           ],
                         ),
                       ),
                     ),
                   onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => LocationPage(
                         pepitoPapas: locationList[index]['name'],
                       //  areaTag: index,
                       )));
                   },
                 );
                 },
             ),
         ):
         Center(
           child: CircularProgressIndicator(),
         )
       ],
     ),
   );
  }

}