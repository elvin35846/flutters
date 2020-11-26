import 'package:flutter/material.dart';

class TextFormFieldTut extends StatefulWidget {
  TextFormFieldTut({Key key}) : super(key: key);

  @override
  _TextFormFieldTutState createState() => _TextFormFieldTutState();
}

class _TextFormFieldTutState extends State<TextFormFieldTut> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        //hintColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.save),
        ),
        appBar: AppBar(title: Text("TextFormFieldTut")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
              child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  hintText: "Adiniz ve Soyadiniz",
                  labelText: "Ad ve Soyad",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email adresiniz",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Sifreniz",
                  labelText: "Shifre",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {},
                child: Text("Yadda saxla", style: TextStyle(color: Colors.white)),
                color: Colors.indigo.shade400,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
