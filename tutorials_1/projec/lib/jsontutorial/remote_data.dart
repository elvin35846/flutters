import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projec/models/RemoteApiModel.dart';
import 'dart:async';
import 'dart:convert';

class RemoteJsonData extends StatefulWidget {
  RemoteJsonData({Key key}) : super(key: key);

  @override
  _RemoteJsonDataState createState() => _RemoteJsonDataState();
}

class _RemoteJsonDataState extends State<RemoteJsonData> {
  Future<List<RemoteApiModel>> _takeData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      //return RemoteApiModel.jsonToMap(json.decode(response.body));
      return (json.decode(response.body) as List)
          .map((e) => RemoteApiModel.jsonToMap(e))
          .toList();
    } else {
      throw Exception("Connect false: ${response.statusCode}");
    }
  }

  RemoteApiModel payloadData;

  // @override
  // void initState() {
  //   super.initState();
  //   _takeData().then((value) {
  //     payloadData = value;
  //     debugPrint("Gelen deyer: " + payloadData.body);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: FutureBuilder(
          future: _takeData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RemoteApiModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].body),
                        leading: CircleAvatar(child: Text(snapshot.data[index].id.toString())),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
