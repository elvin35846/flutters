import 'package:flutter/material.dart';

//import 'firebase/firebaseTutor.dart';
import 'firestore_tutor.dart';
//import 'package:tutorial/models/studentModels.dart';
//import 'package:tutorial/file_operations.dart';
//import 'package:tutorial/sqlite/sqflite_1.dart';
//import 'package:tutorial/utils/database_helpers.dart';
//import 'package:tutorial/shared_pref.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lerning Flutter",
      home: FirestoreIslemleri(),
    );
  }
}
