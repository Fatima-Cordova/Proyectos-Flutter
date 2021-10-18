import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://static.scientificamerican.com/espanol/cache/file/050D641B-C40F-460A-B892534B0024CB3C_source.jpg?w=590&h=800&4147C8A7-B3A4-4126-9293322177AC2D1C'),
              radius: 25.0,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('FC'),
              backgroundColor: Colors.pink,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://i.blogs.es/3d02ff/captura-de-pantalla-2021-06-23-a-las-15.11.51/450_1000.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}