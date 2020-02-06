import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello sayfasi'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.backspace),
            tooltip: 'Air it',
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
        ]
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        color: Colors.cyan,
        child: new Text('Home page', textDirection: TextDirection.ltr),
      ),
    );
  }
}
