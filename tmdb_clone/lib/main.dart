import 'package:flutter/material.dart';
import 'package:tmdb_clone/theme/light_theme.dart';
import 'package:tmdb_clone/widgets/auth/auth_widget.dart';
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
      theme: LightTheme.instance.data,
      routes: {
        '/': (context) => MainScreenWidget(status: false),
        '/auth_page': (context) => AuthWidget(),
      },
      initialRoute: '/',
    );
  }
}
