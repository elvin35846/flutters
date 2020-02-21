import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/auth.dart';

void main() {
  runApp(MaxFitApp());
}

class MaxFitApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Max Fitnes',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ),
      home: AutorizationPage()
    );
  }
}
