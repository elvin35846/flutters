import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  SharedPref({Key key}) : super(key: key);

  @override
  _SharedPrefState createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  String name;
  int id;
  bool gender;
  var formKey = GlobalKey<FormState>();
  var mySharedPrefences;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => mySharedPrefences = value);
  }

  @override
  void dispose() {
    mySharedPrefences.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shared Pref"),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      onSaved: (val) {
                        name = val;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      onSaved: (val) {
                        id = int.parse(val);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter id",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RadioListTile(
                      value: true,
                      groupValue: gender,
                      onChanged: (val) {
                        setState(() {
                          gender = val;
                        });
                      },
                      title: Text("Male"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RadioListTile(
                      value: false,
                      groupValue: gender,
                      onChanged: (val) {
                        setState(() {
                          gender = val;
                        });
                      },
                      title: Text("Famale"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: _ekle,
                        child: Text("Save"),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: _show,
                        child: Text("Show"),
                        color: Colors.green,
                      ),
                      RaisedButton(
                        onPressed: _delet,
                        child: Text("Delete"),
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _ekle() async {
    formKey.currentState.save();
    await (mySharedPrefences as SharedPreferences).setString("myName", name);
    await (mySharedPrefences as SharedPreferences).setInt("myId", id);
    await (mySharedPrefences as SharedPreferences).setBool("myGender", gender);
    debugPrint("Data is saved");
  }

  void _show() {
    debugPrint(
        "Name: " + (mySharedPrefences as SharedPreferences).getString("myName") ??
            "Null");
    debugPrint("Id: " +
            (mySharedPrefences as SharedPreferences).getInt("myId").toString() ??
        "Null");
    debugPrint("Male: " +
            (mySharedPrefences as SharedPreferences)
                .getBool("myGender")
                .toString() ??
        "Null");
  }

  void _delet() {}
}
