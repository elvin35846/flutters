import 'package:flutter/material.dart';
//import 'package:user_test/pages/home_page.dart';
//import 'package:user_test/row_column.dart';

//import 'myContainer.dart';
//import 'myFlexible.dart';
import 'state_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: StateTest(),
    );
  }
}


