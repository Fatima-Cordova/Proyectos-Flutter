import 'package:flutter/material.dart';

void main() {
  runApp(Messages());
}

class Messages extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ExampleState();
  }
}

class ExampleState extends State<Messages>{
  List<String> item = [];
  ScrollController _scrollController = new ScrollController();
  late String temp;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Mensajeria'),
              backgroundColor: Colors.indigoAccent,
            ),
          body: Column(
            children: <Widget>[
                Container(
                  width: 100.0,
                  padding: EdgeInsets.all(6),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Texto', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
                  ),
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                  //maxLength: 100,
                  //maxLines: 2,
                  onChanged: (str){
                    temp = str;
                  },
                ),
                RaisedButton(
                  child: Text('Enviar'),
                  onPressed: () {
                    setState(() {
                      item.add(temp);
                    });
                  },
                  color: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              Card(
                color: Colors.lightBlue[50],

                child: ListView(
                  shrinkWrap: true,
                  children: item.map((element) => Text(element)).toList(),
                ),),
               // ListView(

              //  )
            ],
          )
        )
    );
  }
}

