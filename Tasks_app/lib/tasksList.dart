//import 'package:dio/dio.dart';
//import 'dart:io';

import 'dart:io';
//import 'dart:math';
import 'package:Tasks_app/taskDetail.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/Task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  String url = "https://cdn.fonibo.com/challenges/tasks.json";
  final List<Color> colorCode = [
    Color.fromRGBO(255, 222, 222, 1),
    Color.fromRGBO(91, 177, 255, 0.35),
    Color.fromRGBO(177, 248, 193, 1)
  ];

  Future<List<Task>> fetchTasks() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(1, 118, 225, 1)),
        title: Text(
          "task.",
          style: TextStyle(
            color: Color.fromRGBO(1, 118, 225, 1),
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 53,
        height: 53,
        child: FloatingActionButton(
          onPressed: () {
            taskCreated(context).then((value) {});
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 38,
            color: Color.fromRGBO(1, 118, 225, 1),
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue.shade100),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow.shade100,
                ),
              )),
          ListTile(leading: Icon(Icons.home), title: Text("Menu")),
          ListTile(leading: Icon(Icons.account_balance), title: Text("Menu")),
          ListTile(leading: Icon(Icons.access_alarm), title: Text("Menu")),
          ListTile(leading: Icon(Icons.add_moderator), title: Text("Menu")),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blue),
            title: Text("Exit", style: TextStyle(color: Colors.blue)),
            onTap: () => exit(0),
          ),
        ],
      )),
      body: Padding(
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
                    return listBlock(snapshot);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> taskCreated(BuildContext context) {
    TextEditingController customController = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add new task"),
            content: TextField(
              controller: customController,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
                elevation: 5.0,
                child: Text('Submit'),
              ),
            ],
          );
        });
  }

  Widget listBlock(AsyncSnapshot<List<Task>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskDetail(snapshot.data[index])),
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
                                  createdAt(snapshot.data[index].createdAt
                                      .toString()),
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

  String createdAt(String value) {
    final dateTimeString = value;
    final dateTime = DateTime.parse(dateTimeString);
    final format = DateFormat('dd MMM yyyy');
    final clockString = format.format(dateTime);
    return clockString;
  }
}
