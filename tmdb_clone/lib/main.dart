import 'package:flutter/material.dart';
import 'package:tmdb_clone/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: const Color.fromRGBO(3, 37, 65, 1)),
        primarySwatch: Colors.blue,
      ),
      home: MainScreenWidget(status: false,),
    );
  }
}
