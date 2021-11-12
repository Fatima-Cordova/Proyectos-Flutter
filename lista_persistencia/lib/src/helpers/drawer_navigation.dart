import 'package:flutter/material.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
  }

class _NavigationDrawerState extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/474x/d2/97/a3/d297a3eced48990f8001c8624ec84145.jpg'
                ),
              ),
              accountName: null,
              accountEmail: null,
              decoration: BoxDecoration(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }

}