import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String pageUrl;
  final String title;

  MainCard(this.pageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onDoubleTap: () {
        Navigator.pushNamed(context, pageUrl);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(title),
        color: Colors.blueGrey,
        alignment: Alignment.center,
      ),
    );
  }
}
