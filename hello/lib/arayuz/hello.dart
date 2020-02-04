import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: new Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        color: Colors.cyan,
        child: new Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: new Text('Merhaba Elvin', textDirection: TextDirection.ltr)
        ),
      ),
    );
  }

}