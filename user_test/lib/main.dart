import 'package:flutter/material.dart';
//import 'package:user_test/row_column.dart';

import 'myContainer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyContainer(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing')),
      body: Container(
        child: Center(
          child: Text('Test text'),
        ),
      ),
    );
  }
}
