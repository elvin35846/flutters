import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String itemName;
  int courseCredit = 1;
  double courseValue = 4;
  double average = 0;
  var formKey = GlobalKey<FormState>();
  static int myCounter = 0;

  List<Tutorial> allTutorials;

  @override
  void initState() {
    super.initState();
    allTutorials = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Average score calculation"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
          }
        },
        child: Icon(Icons.add),
      ),
      body: appBody(),
    );
  }

  Widget appBody() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Item name",
                        labelStyle: TextStyle(fontSize: 20),
                        hintText: "Enter item name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (payload) {
                        if (payload.length > 0) {
                          return null;
                        } else {
                          return "Item name not be empty";
                        }
                      },
                      onSaved: (value) {
                        itemName = value;
                        debugPrint("Item name: $itemName");

                        setState(() {
                          allTutorials.add(
                              Tutorial(itemName, courseCredit, courseValue));
                          average = 0;
                          calculateAverage();
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              items: courseCreditItem(),
                              value: courseCredit,
                              onChanged: (selectCredit) {
                                setState(() {
                                  courseCredit = selectCredit;
                                  debugPrint(
                                      "Select course credit: $courseCredit");
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<double>(
                              items: courseValueItem(),
                              value: courseValue,
                              onChanged: (selectValue) {
                                setState(() {
                                  courseValue = selectValue;
                                  debugPrint(
                                      "Select course value: $courseValue");
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 40,
                      color: Colors.blue[100],
                      thickness: 2,
                    ),
                    Container(
                      child: Text(
                        allTutorials.length == 0 ? "Pleace add tutorial!" : "Average: ${average.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Divider(
                      height: 40,
                      color: Colors.blue[100],
                      thickness: 2,
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: _makeListData,
                itemCount: allTutorials.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> courseCreditItem() {
    List<DropdownMenuItem<int>> credit = [];
    for (int i = 1; i <= 10; i++) {
      var val = DropdownMenuItem<int>(
        value: i,
        child: Text("$i Course credit", style: TextStyle(fontSize: 20)),
      );
      credit.add(val);
    }
    return credit;
  }

  List<DropdownMenuItem<double>> courseValueItem() {
    List<DropdownMenuItem<double>> value = [];
    value.add(DropdownMenuItem(
        child: Text("AA grade", style: TextStyle(fontSize: 20)), value: 4));
    value.add(DropdownMenuItem(
        child: Text("BA grade", style: TextStyle(fontSize: 20)), value: 3.5));
    value.add(DropdownMenuItem(
        child: Text("BB grade", style: TextStyle(fontSize: 20)), value: 3));
    value.add(DropdownMenuItem(
        child: Text("BC grade", style: TextStyle(fontSize: 20)), value: 2.5));
    value.add(DropdownMenuItem(
        child: Text("CC grade", style: TextStyle(fontSize: 20)), value: 2));
    value.add(DropdownMenuItem(
        child: Text("DC grade", style: TextStyle(fontSize: 20)), value: 1.5));
    value.add(DropdownMenuItem(
        child: Text("DD grade", style: TextStyle(fontSize: 20)), value: 1));
    value.add(DropdownMenuItem(
        child: Text("FF grade", style: TextStyle(fontSize: 20)), value: 0));
    return value;
  }

  Widget _makeListData(BuildContext context, int index) {
    myCounter++;
    return Dismissible(
      key: Key(myCounter.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        setState(() {
          allTutorials.removeAt(index);
          calculateAverage();
        });
      },
      child: Card(
        child: ListTile(
          title: Text(allTutorials[index].name),
          subtitle: Text("Credit: " +
              allTutorials[index].credit.toString() +
              "Rating: " +
              allTutorials[index].grade.toString()),
        ),
      ),
    );
  }

  void calculateAverage() {
    double sumGrade = 0;
    double sumCredit = 0;
    for (var val in allTutorials) {
      sumGrade = sumGrade + (val.grade * val.credit);
      sumCredit = sumCredit + val.credit;
    }

    average = sumGrade / sumCredit;
  }
}

class Tutorial {
  String name;
  double grade;
  int credit;

  Tutorial(this.name, this.credit, this.grade);
}
