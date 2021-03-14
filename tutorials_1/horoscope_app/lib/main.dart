import 'package:flutter/material.dart';

import 'horoscope_detail.dart';
import 'horoscope_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horoscope app",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcList",
      routes: {
        "/": (context) => HoroscopeList(),
        "/burcList": (context) => HoroscopeList(),
      },
      onGenerateRoute: (settings) {
        List<String> pathElement = settings.name.split("/");
        if(pathElement[1] == "burcDetay") {
          return MaterialPageRoute(builder: (context) => HoroscopeDetail(int.parse(pathElement[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HoroscopeList(),
    );
  }
}
