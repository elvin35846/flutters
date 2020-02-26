import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BasitHttp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HttpState();
}

class HttpState extends State<BasitHttp> {
  var veri = "No veri";

  getIslemiYap() {
    http.get("https://jsonplaceholder.typicode.com/posts/1").then((cevap){
      print(cevap.statusCode);
      setState(() {
        veri = cevap.body;
      });
    });
    print("Get butonunu denediniz");
  }

  postIslemiYap() {
    http.post("https://jsonplaceholder.typicode.com/posts/1", body: {
      "title": "Uygulamadan geldim",
      "body": "Uyqulamadan gonderilen yazi buna karshiliq sunucudan bir cevap gelecek.",
      "userId": "2",
      "id": "500"
    }).then((cevap){
      print(cevap.statusCode);
      print(cevap.body);
      setState(() {
        veri = cevap.body;
      });
    });
    print("Post butonunu denediniz");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basit HTTP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                color: Colors.greenAccent,
                child: Text(
                  "Get",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: getIslemiYap,
              )),
              Expanded(
                  child: RaisedButton(
                color: Colors.redAccent,
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: postIslemiYap,
              ))
            ],
          ),
          Expanded(
              child: Center(
            child: ListView(
              children: <Widget>[
                Text("Gelen veri: \n $veri")
              ],
            ),
          ))
        ],
      ),
    );
  }
}
