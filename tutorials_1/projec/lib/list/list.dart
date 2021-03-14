import 'package:flutter/material.dart';

import 'custom_scrool_view.dart';
//import 'grid_view.dart';
//import 'etkin_list.dart';
//import 'list_body.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My List Tutorial",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Liste dersi",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: CustomScrollViewTutorial(),
      ),
    );
  }
}
