import 'package:flutter/material.dart';
import 'dart:convert';

class JsonTutorial2 extends StatefulWidget {
  JsonTutorial2({Key key}) : super(key: key);

  @override
  _JsonTutorial2State createState() => _JsonTutorial2State();
}

class _JsonTutorial2State extends State<JsonTutorial2> {
  @override
  Widget build(BuildContext context) {
    myData();
    return Container(
      child: Text("readrData()"),
    );
  }

  void myData() async {
    // Future<String> readDataJson =
    //     DefaultAssetBundle.of(context).loadString("assets/data/cars.json");

    // readDataJson.then((value) {
    //   debugPrint("data" + value);
    // });

    var peyload = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cars.json");
    debugPrint("data" + peyload);
    var carsLists = jsonDecode(peyload.toString());
  }
}
