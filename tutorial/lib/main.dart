import 'package:flutter/material.dart';

void main() {
  runApp(FlutterTutorialApp());
}

class FlutterTutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lerning Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lerning Flutter"),
        ),
        // body: Image.asset('assets/images/1.jpg'),
        body: Align(
          child: IconButton(
            icon: Icon(
              Icons.search,
              size: 50.0,
              color: Colors.red,
            ),
            onPressed: () {
              print('Icon button on press');
            },
          ),
          alignment: Alignment.centerLeft,
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Add'),
          onPressed: null,
        ),
        //bottomNavigationBar: BottomNavigationBar()
      ),
    );
  }
}
