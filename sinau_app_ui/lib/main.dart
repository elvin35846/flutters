import 'package:flutter/material.dart';
import 'package:sinau_app_ui/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinau app',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.black,
        primaryColor: Color(0xff6360FF),
        primaryColorDark: Colors.white,
        primaryColorLight: Color(0xff212325),
        unselectedWidgetColor: Colors.white,
        focusColor: Colors.black,
        hintColor: Colors.white,
        backgroundColor: Color(0xffF1F1FA),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.black,
        primaryColor: Color(0xff212325),
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
        unselectedWidgetColor: Color(0xff212325),
        focusColor: Colors.white,
        hintColor: Color(0xff212325),
        backgroundColor: Colors.black,
      ),
      home: MainPage(),
    );
  }
}
