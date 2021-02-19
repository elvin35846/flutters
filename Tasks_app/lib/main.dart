import 'package:flutter/material.dart';

import 'tasksList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks app',
      debugShowCheckedModeBanner: false,
      home: TasksList(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}


