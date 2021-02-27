import 'package:Tasks_app/detail_page.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'components/date_format.dart';
import 'models/task.dart';

class HomePageList extends StatefulWidget {
  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  String url = "https://cdn.fonibo.com/challenges/tasks.json";

// Fet all task
  Future<List<Task>> fetchTasks() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }


// Color for marker task
  final List<Color> colorCode = [
    Color.fromRGBO(255, 222, 222, 1),
    Color.fromRGBO(91, 177, 255, 0.35),
    Color.fromRGBO(177, 248, 193, 1)
  ];


// Home page view
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20, left: 4),
            child: Text(
              "Tasks",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: FutureBuilder<List<Task>>(
              future: fetchTasks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return listElement(snapshot);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }


// List view
  Widget listElement(AsyncSnapshot<List<Task>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(snapshot.data[index])),
              );
            },
            child: Container(
              height: 66,
              padding: EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    width: 9.25,
                    margin: EdgeInsets.only(right: 6.16),
                    decoration: BoxDecoration(
                      color: colorCode[index],
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12, right: 24, bottom: 12, left: 18.6),
                      height: 66,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color.fromRGBO(248, 248, 248, 1)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data[index].title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  MyDateFormat.dateFormat(snapshot.data[index].createdAt.toString()),
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.brightness_1_outlined,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
