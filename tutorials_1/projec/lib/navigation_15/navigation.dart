import 'package:flutter/material.dart';

import 'navigation_work.dart';

class MyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation paragraph 15",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: NavigationWork(),
    );
  }
}