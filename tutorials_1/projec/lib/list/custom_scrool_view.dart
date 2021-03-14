import 'package:flutter/material.dart';
import 'dart:math' as matematik;

class CustomScrollViewTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          //iconTheme: IconThemeData(color: Colors.red),
          title: Text(
            "Sliver App Bar",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade400,
          expandedHeight: 200,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://pasinfotech.com/wp-content/uploads/2019/06/flutter-banner.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // SliverList(
        //   delegate: SliverChildListDelegate(
        //     sabitListeElemanlari(),
        //   ),
        // ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
        //       childCount: 15),
        // ),

        // SliverFixedExtentList(
        //   delegate: SliverChildListDelegate(
        //     sabitListeElemanlari(),
        //   ),
        //   itemExtent: 300,
        // ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
              childCount: 16),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ],
    );
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      child: Text(
        "Sabit liste elemanlari ${index + 1}",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(
        matematik.Random().nextInt(250),
        matematik.Random().nextInt(250),
        matematik.Random().nextInt(250),
        matematik.Random().nextInt(250));
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanlari",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        color: Colors.amber,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanlari",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        color: Colors.teal,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanlari",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        color: Colors.blue,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanlari",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        color: Colors.orange,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanlari",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        color: Colors.purple,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanlari",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        color: Colors.cyan,
        alignment: Alignment.center,
      ),
    ];
  }
}
