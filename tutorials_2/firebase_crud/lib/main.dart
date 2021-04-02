import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseCrud(),
  ));
}

class FirebaseCrud extends StatefulWidget {
  @override
  _FirebaseCrudState createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  String id, name, category;
  int pageCount;

  takeId(bookId) {
    this.id = bookId;
  }

  takeName(bookName) {
    this.name = bookName;
  }

  takeCategy(bookCategory) {
    this.category = bookCategory;
  }

  takePage(bookPage) {
    this.pageCount = int.parse(bookPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            TextFormField(
              onChanged: (String bookId) {
                takeId(bookId);
              },
              decoration: InputDecoration(
                labelText: "Book ID",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextFormField(
              onChanged: (String bookName) {
                takeName(bookName);
              },
              decoration: InputDecoration(
                labelText: "Book name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextFormField(
              onChanged: (String bookCategory) {
                takeCategy(bookCategory);
              },
              decoration: InputDecoration(
                labelText: "Book category",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextFormField(
              onChanged: (String bookPage) {
                takePage(bookPage);
              },
              decoration: InputDecoration(
                labelText: "Book pages",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      addData();
                    },
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 5,
                    )),
                ElevatedButton(
                    onPressed: () {
                      readData();
                    },
                    child: Text("Read"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      onPrimary: Colors.white,
                      shadowColor: Colors.yellowAccent,
                      elevation: 5,
                    )),
                ElevatedButton(
                    onPressed: () {
                      editData();
                    },
                    child: Text("Edit"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 5,
                    )),
                ElevatedButton(
                    onPressed: () {
                      deletData();
                    },
                    child: Text("Delet"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      shadowColor: Colors.orangeAccent,
                      elevation: 5,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //----- add data in firebase ---
  void addData(){}

  //----- read data in firebase ---
  void readData(){}

  //----- edit data in firebase ---
  void editData(){}

  //----- delet data in firebase ---
  void deletData(){}
}
