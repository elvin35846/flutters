import 'package:flutter/material.dart';

class AlertTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlertState();
}

class AlertState extends State<AlertTextField> {
  final yaziKontrolcusu = TextEditingController();
  final genelKontrolcu = GlobalKey<FormState>();

  @override
  void dispose() {
    yaziKontrolcusu.dispose();
    super.dispose();
  }

  void selamla() {
    if (genelKontrolcu.currentState.validate()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Selamlama"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Merhaba ${yaziKontrolcusu.text}"),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Tamam"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text ve Alert kullanimi"),
      ),
      body: Form(
        key: genelKontrolcu,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (yazi) {
                  if (yazi.isEmpty) {
                    return "Lutfen bu kismi bosh burakmayin!";
                  }
                  return null;
                },
                controller: yaziKontrolcusu,
                decoration: InputDecoration(hintText: "Lutfen isminizi yazin"),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.lime,
                  child: Text(
                    "Salamla",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  onPressed: selamla,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
