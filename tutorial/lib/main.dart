import 'package:flutter/material.dart';
import 'package:tutorial/file_operations.dart';
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
      home: FileOperations(),
    );
  }
}
