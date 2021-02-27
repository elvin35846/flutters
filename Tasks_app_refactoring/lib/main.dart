import 'package:flutter/material.dart';
import 'dart:io';

import 'home_page_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks app',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      appBar: buildAppBar(),
      floatingActionButton: floatingActionButton(),
      drawer: buildDrawerMenu(),
      body: HomePageList()
    );
  }


// Drawer menu
  Drawer buildDrawerMenu() {
    return Drawer(
        child: ListView(
      children: [
        Container(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade100),
              child: CircleAvatar(
                backgroundColor: Colors.yellow.shade100,
              ),
            )),
        ListTile(leading: Icon(Icons.home), title: Text("Menu")),
        ListTile(leading: Icon(Icons.account_balance), title: Text("Menu")),
        ListTile(leading: Icon(Icons.access_alarm), title: Text("Menu")),
        ListTile(leading: Icon(Icons.add_moderator), title: Text("Menu")),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.blue),
          title: Text("Exit", style: TextStyle(color: Colors.blue)),
          onTap: () => exit(0),
        ),
      ],
    ));
  }


// Bottom action button
  Container floatingActionButton() {
    return Container(
      width: 53,
      height: 53,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 38,
          color: Color.fromRGBO(1, 118, 225, 1),
        ),
      ),
    );
  }

// App bar
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color.fromRGBO(1, 118, 225, 1)),
      title: Text(
        "task.",
        style: TextStyle(
          color: Color.fromRGBO(1, 118, 225, 1),
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}


