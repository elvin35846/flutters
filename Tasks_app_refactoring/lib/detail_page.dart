import 'package:flutter/material.dart';
import 'components/date_format.dart';
import 'models/task.dart';

class DetailPage extends StatelessWidget {
  final Task data;
  DetailPage(this.data);

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
                    MyDateFormat.dateFormat(data.createdAt.toString()),
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
}
