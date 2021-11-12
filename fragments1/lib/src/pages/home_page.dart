import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController? _tabController;

 // List<Widget> containers


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: 1
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whats Clon'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {

              }
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "ESTADOS",
            ),
            Tab(
              text: "LLAMADAS",
            ),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: [
          Container(
            child: Text("Cámara", style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            color: Colors.pink,
          ),
            Container(
                child: Text("Chats", style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
              color: Colors.blue,
            ),
            Container(
              child: Text("Estados", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
              color: Colors.green,
            ),
            Container(
              child: Text("Llamadas", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
              color: Colors.purpleAccent[100],
            ),
          ],
        ),
      ),
    );
  }
}