import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:tutorial/models/studentModels.dart';

class SqfliteTutorial extends StatefulWidget {
  SqfliteTutorial({Key key}) : super(key: key);

  @override
  _SqfliteTutorialState createState() => _SqfliteTutorialState();
}

class _SqfliteTutorialState extends State<SqfliteTutorial> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SqFlite Tutorial"),
        ),
        body: Center(child: Text("Sqlite 1")),
      ),
    );
  }
}
