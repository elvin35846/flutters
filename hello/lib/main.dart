import 'package:flutter/material.dart';
import './arayuz/home.dart';
import './arayuz/hello.dart';
import './arayuz/scf.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ScaffolUyesi(),
      '/home': (context) => Home(),
      '/hello': (context) => Hello(),

    },
  ));
}
