import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class EtkinListe extends StatelessWidget {
  List<Students> allStudents = [];

  @override
  Widget build(BuildContext context) {
    getStudentList();

    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        color: index % 2 == 0 ? Colors.red.shade200 : Colors.orange.shade200,
        elevation: 4,
        child: ListTile(
          leading: Icon(Icons.perm_contact_calendar),
          title: Text(allStudents[index]._name),
          subtitle: Text(allStudents[index]._description),
          trailing: Icon(Icons.add),
          onTap: () {
            debugPrint(allStudents[index].toString());
            toastMessages(index);
          },
          onLongPress: () {
            debugPrint("Long press $index");
            toastMessages(index);
          },
        ),
      ),
    );
  }

  void getStudentList() {
    allStudents = List.generate(
        200,
        (index) => Students("Student $index name", "Student $index description",
            index % 2 == 0 ? true : false));
  }

  void toastMessages(int index) {
    Fluttertoast.showToast(
      msg: allStudents[index].toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }
}

class Students {
  String _name;
  String _description;
  // ignore: unused_field
  bool _gender;

  Students(this._name, this._description, this._gender);

  @override
  String toString() {
    return "Select student name: $_name, description: $_description";
  }
}
