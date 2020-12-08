import 'package:flutter/material.dart';

import 'jsontutorial2.dart';

class JsonTutorial extends StatelessWidget {
  const JsonTutorial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "Json Tutorial",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Json Tutorial"),
          ),
          body: JsonTutorial2(),
        ),
      ),
    );
  }
}
