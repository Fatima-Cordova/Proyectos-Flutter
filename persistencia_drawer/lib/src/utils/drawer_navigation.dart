import 'package:flutter/material.dart';
import 'package:persistencia_drawer/src/pages/categories_page.dart';
import 'package:persistencia_drawer/src/pages/home_page.dart';
import 'package:persistencia_drawer/src/pages/menu_page.dart';
import 'package:persistencia_drawer/src/services/category_services.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  List<Widget> _categoryList = <Widget>[];

  CategoryServices _categoryServices = CategoryServices();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://w7.pngwing.com/pngs/419/473/png-transparent-computer-icons-user-profile-login-user-heroes-sphere-black.png'
                ),
              ),
              accountName: Text('Fatima Cordova'),
              accountEmail: Text('fatima@gmail.com'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage())),
            ),
            ListTile(
              leading: Icon(Icons.list_rounded),
              title: Text('Categorías'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CategoriesPage())),
            ),
            Divider(),
            Column(
              children: _categoryList,
            ),
          ],
        ),
      ),
    );
  }

  getAllCategories() async {
    var categories = await _categoryServices.readCategories();
    categories.forEach((category) {
      _categoryList.add(ListTile(
        title: Text(category['name']),
      ));
    });
  }

}