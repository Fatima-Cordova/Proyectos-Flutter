import 'package:flutter/material.dart';


class CardPage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {


    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('ccc'),
            subtitle: Text('cccccccccccccccc'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {

                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {

    final card = Container(
      //    clipBehavior: Clip.antiAlias,   ----Sirve para que nada se salga de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/33/261/282/5bd28eeaec175-wallpaper-preview.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
         /* Image(
            image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/33/261/282/5bd28eeaec175-wallpaper-preview.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
              child: Text('Imagen de paisaje')
          )
        ],
      ),
    );

    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      //    color: Colors.deepOrangeAccent
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0x5E000000),
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: card,

        ),
    );
  }
}