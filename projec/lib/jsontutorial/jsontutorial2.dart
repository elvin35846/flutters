import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:projec/models/Cars.dart';

class JsonTutorial2 extends StatefulWidget {
  JsonTutorial2({Key key}) : super(key: key);

  @override
  _JsonTutorial2State createState() => _JsonTutorial2State();
}

class _JsonTutorial2State extends State<JsonTutorial2> {
  List allCarsData;
  List<Cars> newAllCarsData;

  @override
  void initState() {
    super.initState();
    newAllCarsData = [];
  }

// Birinci usul
  /* @override
  void initState() {
    super.initState();
    myData().then((value) {
      setState(() {
        allCarsData = value;
      });
    });
  }
*/

// Birinci usul
  /*@override
  Widget build(BuildContext context) {
    if (allCarsData != null) {
      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(allCarsData[index]["car_name"]),
              subtitle: Text(allCarsData[index]["country"]),
            );
          },
          itemCount: allCarsData.length,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  } */

//Ikinci usul
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: myData(),
        builder: (context, result) {
          if (result.hasData) {
            newAllCarsData = result.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(newAllCarsData[index].carName.toString()),
                  subtitle: Text(newAllCarsData[index].country.toString()),
                );
              },
              itemCount: newAllCarsData.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Cars>> myData() async {
    // Future<String> readDataJson =
    //     DefaultAssetBundle.of(context).loadString("assets/data/cars.json");

    // readDataJson.then((value) {
    //   debugPrint("data" + value);
    // });

    //Birinci usul
    /* var peyload = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cars.json");
    debugPrint("data" + peyload);
    List carsLists = jsonDecode(peyload.toString());

    return carsLists;
    */

    // Ikinci usul
    var peyload = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cars.json");
    List<Cars> data = (jsonDecode(peyload) as List)
        .map((e) => Cars.fromJsonMap(e))
        .toList();
    return data;
  }
}
