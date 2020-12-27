import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:tutorial/models/studentModels.dart';
import 'package:tutorial/utils/database_helpers.dart';

class SqfliteTutorial extends StatefulWidget {
  SqfliteTutorial({Key key}) : super(key: key);

  @override
  _SqfliteTutorialState createState() => _SqfliteTutorialState();
}

class _SqfliteTutorialState extends State<SqfliteTutorial> {
  DatabaseHelper _databaseHelper;
  List<Students> allStudentsList;
  var formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool active = false;
  var _controller = TextEditingController();
  int selectStudentIndex;
  int selectStudentDBIndex;

  @override
  void initState() {
    super.initState();
    allStudentsList = List<Students>();
    _databaseHelper = DatabaseHelper();
    _databaseHelper.allStudents().then((value) {
      for (Map i in value) {
        allStudentsList.add(Students.converObjectfromReadDBMap(i));
      }
      print("Number of students in DB " + allStudentsList.length.toString());
    }).catchError((onError) => print("Error: $onError"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("SqFlite Tutorial"),
        ),
        body: Container(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controller,
                        validator: (nameControl) {
                          if (nameControl.length <= 3) {
                            return "Enter minimun 3 simbols";
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Student name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SwitchListTile(
                      value: active,
                      onChanged: (isActive) {
                        setState(() {
                          active = isActive;
                        });
                      },
                      title: Text("Active"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text("Save"),
                    color: Colors.green,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        _addStudent(
                            Students(active == true ? 1 : 0, _controller.text));
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text("Edit"),
                    color: Colors.yellow,
                    onPressed: selectStudentDBIndex == null
                        ? null
                        : () {
                            if (formKey.currentState.validate()) {
                              _editStudent(Students.withID(
                                  active == true ? 1 : 0,
                                  _controller.text,
                                  selectStudentDBIndex));
                            }
                          },
                  ),
                  RaisedButton(
                    child: Text("Delete all"),
                    color: Colors.red,
                    onPressed: () {
                      _deleteAllStudents();
                    },
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: allStudentsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: allStudentsList[index].active == 1
                              ? Colors.green.shade200
                              : Colors.red.shade200,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                _controller.text = allStudentsList[index].name;
                                active = allStudentsList[index].active == 1
                                    ? true
                                    : false;
                                selectStudentIndex = index;
                                selectStudentDBIndex =
                                    allStudentsList[index].id;
                              });
                            },
                            title: Text(allStudentsList[index].name),
                            subtitle:
                                Text(allStudentsList[index].id.toString()),
                            trailing: GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () {
                                _deleteStudent(
                                    allStudentsList[index].id, index);
                              },
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void _addStudent(Students student) async {
    var newStudentId = await _databaseHelper.addStudent(student);
    student.id = newStudentId;
    if (newStudentId > 0) {
      setState(() {
        allStudentsList.insert(0, student);
      });
    }
    _controller.text = "";
  }

  void _deleteAllStudents() async {
    var deletStudentCount = await _databaseHelper.deleteAllStudents();
    if (deletStudentCount > 0) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text(deletStudentCount.toString() + " Student is deleted!"),
      ));
      setState(() {
        allStudentsList.clear();
      });
    }
    selectStudentDBIndex = null;
    _controller.text = "";
  }

  void _deleteStudent(int idFOrDBdeleted, int idForListDeleted) async {
    var result = await _databaseHelper.deleteStudent(idFOrDBdeleted);
    if (result == 1) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text(result.toString() + " Student is deleted!"),
      ));
      setState(() {
        allStudentsList.removeAt(idForListDeleted);
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Error on remote"),
      ));
    }
    selectStudentDBIndex = null;
    _controller.text = "";
  }

  void _editStudent(Students student) async {
    var result = await _databaseHelper.editStudent(student);
    if (result == 1) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text(result.toString() + " Student is edit!"),
      ));
      setState(() {
        allStudentsList[selectStudentIndex] = student;
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Error on remote"),
      ));
    }
    _controller.text = "";
  }
}
