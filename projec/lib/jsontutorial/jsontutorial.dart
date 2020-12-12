import 'package:flutter/material.dart';
import 'package:projec/jsontutorial/remote_data.dart';

//import 'jsontutorial2.dart';

class JsonTutorial extends StatelessWidget {
  const JsonTutorial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Json Tutorial",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Json Tutorial"),
          ),
          body: RemoteJsonData(),
        ),
      ),
    );
  }
}
