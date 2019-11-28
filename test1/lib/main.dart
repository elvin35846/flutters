import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "My first app",

      home: Scaffold(
        appBar: AppBar(
          title: Text("App bar title"),
        ),
        body: Material(
          color: Colors.red,
          child: Center(
            child: Text(
              "Hello world",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black, fontSize: 50.0),
      ),
      )),
      )),
  );
}
