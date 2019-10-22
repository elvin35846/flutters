import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: new Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        color: Colors.cyan,
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            verticalDirection: VerticalDirection.down,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              new Container(
                color: Colors.black,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Salam Flutter",
                  textDirection: TextDirection.ltr,
                ),
              ),
              new Container(
                color: Colors.black,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Salam Flutter",
                  textDirection: TextDirection.ltr,
      
                ),
              ),
            ],
          ),
      ),
    );
  }

}