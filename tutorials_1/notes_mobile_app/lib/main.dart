import 'package:flutter/material.dart';
import 'package:notes_mobile_app/models/categories.dart';
import 'package:notes_mobile_app/pages/main_page.dart';
import 'package:notes_mobile_app/utils/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(),
    );
  }
}

class NoteList extends StatelessWidget {
  //const NoteList({Key key}) : super(key: key);
  DatabaseHelper databaseHelper = DatabaseHelper();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Center(child: Text('Basket of Notes')),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: () {
                  addCategory(context);
                },
                tooltip: "Add category",
                child: Icon(Icons.add_circle),
                mini: true),
            FloatingActionButton(
                onPressed: () {}, tooltip: "Add note", child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }

  void addCategory(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    String newCategoryName;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Add category',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            children: [
              Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        newCategoryName = value;
                      },
                      validator: (enterCategoryName) {
                        if (enterCategoryName.length < 3) {
                          return "Enter min 3 simbols";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Category name',
                          border: OutlineInputBorder()),
                    ),
                  )),
              ButtonBar(
                children: [
                  RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          databaseHelper
                              .addCategories(Categories(newCategoryName))
                              .then((categoryID) {
                            if (categoryID > 0) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Category is added"),
                                duration: Duration(seconds: 2),
                              ));
                              Navigator.pop(context);
                            }
                          });
                        }
                      },
                      color: Colors.greenAccent,
                      child:
                          Text('Save', style: TextStyle(color: Colors.white))),
                  RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.redAccent,
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ],
          );
        });
  }
}
