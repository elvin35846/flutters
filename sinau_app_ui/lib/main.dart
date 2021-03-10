import 'package:flutter/material.dart';
import 'package:sinau_app_ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinau app',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(brightness: Brightness.light, accentColor: Colors.black),
      darkTheme:
          ThemeData(brightness: Brightness.dark, accentColor: Colors.white),
      home: HomePage(),
    );
  }
}
