import 'package:flutter/material.dart';

class TextFormFieldTut extends StatefulWidget {
  TextFormFieldTut({Key key}) : super(key: key);

  @override
  _TextFormFieldTutState createState() => _TextFormFieldTutState();
}

class _TextFormFieldTutState extends State<TextFormFieldTut> {
  String _nameSurname, _password, _email, _gender;
  final formKey = GlobalKey<FormState>();
  bool control = false;
  bool checkBox = false;
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
              key: formKey,
              //autovalidate: control,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      hintText: "Adiniz ve Soyadiniz",
                      labelText: "Ad ve Soyad",
                      border: OutlineInputBorder(),
                    ),
                    //initialValue: "Elvin",
                    onSaved: (payload) => _nameSurname = payload,
                    validator: (String val) {
                      if (val.length < 5) {
                        return "Adiniz ve Soyadinizi dogru yazin!";
                      } else {
                        return null;
                      }
                    },
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
                    onSaved: (payload) => _email = payload,
                    validator: (String val) {
                      if (!val.contains("@")) {
                        return "Emaili duzgun yazin!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Sifreniz",
                      labelText: "Sifre",
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (payload) => _password = payload,
                    validator: (String val) {
                      if (val.length < 6) {
                        return "Sifrenin minimum uzunlugu 6 olmalidir!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 0),
                  CheckboxListTile(
                      title: Text("Qaydalar ile razisiniz?"),
                      value: checkBox,
                      onChanged: (payload) {
                        setState(() {
                          checkBox = payload;
                        });
                      }),
                  RadioListTile(
                    value: "Kisi",
                    groupValue: _gender,
                    onChanged: (payload) {
                      setState(() {
                        _gender = payload;
                      });
                    },
                    title: Text("Kisi"),
                  ),
                  RadioListTile(
                    value: "Qadin",
                    groupValue: _gender,
                    onChanged: (payload) {
                      setState(() {
                        _gender = payload;
                      });
                    },
                    title: Text("Qadin"),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {
                      _confirm();
                    },
                    child: Text("Yadda saxla",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.indigo.shade400,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _confirm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Daxil olan ad ve soyad: $_nameSurname, email: $_email, sifre: $_password, cinsi: $_gender");
    } else {
      control = true;
    }
    checkBox
        ? debugPrint("Istifadeci qaydalar ile razidir.")
        : debugPrint("Istifadeci qaydalar ile razi deyil.");
  }
}
