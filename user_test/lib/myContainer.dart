import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            //shape: BoxShape.circle,
            border: Border.all(),
          ),
          //alignment: Alignment.center,
          // width: 200,
          // height: 200,
          //margin: const EdgeInsets.all(10.0),
          //padding: const EdgeInsets.all(5.0),
          child: Text('My container'),
        ),
      ),
    );
  }
}
