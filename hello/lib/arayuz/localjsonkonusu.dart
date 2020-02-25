import 'dart:convert';
import 'package:flutter/material.dart';

class LokalJsonKonusu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LocaleJsonState();
}

class LocaleJsonState extends State<LokalJsonKonusu>{

  List ogrenciListesi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Json"),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/veriler/sinif.json"),
            builder: (context, payload) {
              ogrenciListesi = jsonDecode(payload.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Okul N: ${ogrenciListesi[index]['okulno']}"),
                        Text("Adi: " + ogrenciListesi[index]['ad']),
                        Text("Soyadi: " + ogrenciListesi[index]['soyadi']),
                        Text("Cinsiyet: " + ogrenciListesi[index]['cinsiyet'])
                      ],
                    )
                  );
                },
                itemCount: ogrenciListesi == null ? 0 : ogrenciListesi.length,
              );
            }
          ),
        ),
      ),
    );
  }
}
