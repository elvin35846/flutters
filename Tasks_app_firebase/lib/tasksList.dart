import 'dart:io';
import 'dart:ui';

import 'package:Tasks_app_firebase/models/Task.dart';
import 'package:Tasks_app_firebase/taskDetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:toast/toast.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTasks() {
    var ref = _firebase.collection('tasks').snapshots();
    return ref;
  }

  Future addTask(String title, String createdAt) async {
    var ref = _firebase.collection('tasks');
    var documentRef = await ref.add({'title': title, 'createdAt': createdAt});
    return Task(id: documentRef.id, title: title, createdAt: createdAt);
  }

  Future<void> deleteTask(String taskId) {
    var ref = _firebase.collection('tasks').doc(taskId).delete();
    return ref;
  }

  Future<void> updateTask(String taskId, String title) {
    var ref =
        _firebase.collection('tasks').doc(taskId).update({'title': title});
    return ref;
  }

  final List<Color> colorCode = [
    Color.fromRGBO(177, 248, 193, 1),
    Color.fromRGBO(255, 222, 222, 1),
    Color.fromRGBO(91, 177, 255, 0.35)
  ];
  var colorIndex = 0;

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
              child: StreamBuilder(
                stream: getTasks(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                  if (!snapshots.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return listBlock(snapshots);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  taskCreated(BuildContext context) {
    TextEditingController customController = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Task title"),
            content: TextField(
              controller: customController,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  addTask(customController.text.toString(),
                      DateTime.now().toString());
                  Navigator.of(context).pop();
                },
                child: Text('Add'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  taskUpdate(taskId) {
    TextEditingController customController = new TextEditingController();
    String oldTaskTitle = '??????????????';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit task title"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Old title',
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
                Text(oldTaskTitle),
                SizedBox(height: 20),
                Text(
                  'New title',
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
                TextField(
                  controller: customController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter new title',
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  updateTask(taskId, customController.text.toString());
                },
                child: Text('Edit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  Widget listBlock(AsyncSnapshot<QuerySnapshot> snapshots) {
    return ListView.builder(
        itemCount: snapshots.data.docs.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: [
              IconSlideAction(
                caption: 'Edit',
                color: Colors.grey.shade400,
                icon: Icons.edit,
                closeOnTap: false,
                onTap: () {
                  taskUpdate(snapshots.data.docs[index].id.toString());
                },
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red.shade400,
                icon: Icons.delete,
                closeOnTap: false,
                onTap: () {
                  deleteTask(snapshots.data.docs[index].id.toString());
                },
              ),
            ],
            dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
            child: GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TaskDetail(snapshots.data.docs[index])),
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
                        color: colorCode[
                            colorIndex < 2 ? ++colorIndex : colorIndex = 0],
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
                                    snapshots.data.docs[index]['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    createdAt(snapshots.data.docs[index]
                                        ['createdAt']),
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
