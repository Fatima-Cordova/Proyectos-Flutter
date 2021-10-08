import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();

}

class _State extends State<MyApp> {
  final List<String> messages = <String>[];
 // final List<int> msgCount = <int>[];

  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      messages.insert(0,nameController.text);
    });
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: 'Mensaje enviado',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.black
    );
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
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Texto',  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius
                      .all(Radius.circular(50)))
                  ),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                color: Colors.indigoAccent,
                highlightElevation: 20.0,
                child: Text('Enviar'),
                highlightColor: Colors.amberAccent[200],
                onPressed: () {
                  addItemToList();
                  _showToast();
                },
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(4),
                          color: Colors.blueGrey[50],                            child: ListTile(
                              title: Text('${messages[index]}', style: TextStyle(fontSize: 15),
                              ),
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: '${messages[index]}',
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 1,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.black
                                );
                              },
                            )
                        );
                      }
                  )
              )
            ]
        )
        )
    );
  }
}