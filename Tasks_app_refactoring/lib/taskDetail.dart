import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/Task.dart';

class TaskDetail extends StatelessWidget {
  final Task data;
  TaskDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color.fromRGBO(1, 118, 225, 1)),
          title: Text(
            "test detail",
            style: TextStyle(
              color: Color.fromRGBO(1, 118, 225, 1),
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Color.fromRGBO(1, 118, 225, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    createdAt(data.createdAt.toString()),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String createdAt(String value) {
    final dateTimeString = value;
    final dateTime = DateTime.parse(dateTimeString);
    final format = DateFormat('dd MMM yyyy HH:mm a');
    final clockString = format.format(dateTime);
    return clockString;
  }
}
