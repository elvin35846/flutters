import 'package:flutter/material.dart';

import 'navigation_15/navigation.dart';

//import 'list/list.dart';

void main() {
  runApp(MyNavigation());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: "MaterialApp Titile",
      home: MyHomePage(bashliq: "My-Home-Page"),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {

  final String bashliq;
  int say = 0;

  MyHomePage({this.bashliq});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bashliq),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            SayyacDegeriniArtir();
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Buttona basilma sayisi"),
            Text(
              "${widget.say}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  void SayyacDegeriniArtir() {
    widget.say++;
    debugPrint("Indiki sayi: ${widget.say}");
  }
}
