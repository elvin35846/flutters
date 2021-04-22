import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(child: Text('Id')),
                Expanded(child: Text('Name')),
                Expanded(child: Text('Category')),
                Expanded(child: Text('Page count')),
              ],
            ),
            SizedBox(height: 10),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('library').snapshots(),
              builder: (context, getData) {
                if (getData.hasError) {
                  return Text('Error get data...');
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: getData.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot rowData = getData.data.docs[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(child: Text(rowData['bookId'])),
                          Expanded(child: Text(rowData['bookName'])),
                          Expanded(child: Text(rowData['bookCategory'])),
                          Expanded(child: Text(rowData['bookPageCount'])),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //----- add data in firebase ---
  void addData() {
    DocumentReference dataUrl =
        FirebaseFirestore.instance.collection('library').doc(id);

    Map<String, dynamic> books = {
      'bookId': id,
      'bookName': name,
      'bookCategory': category,
      'bookPageCount': pageCount.toString(),
    };

    dataUrl.set(books).whenComplete(() {
      Fluttertoast.showToast(msg: 'Add book with ID: ' + id);
    });
  }

  //----- read data in firebase ---
  void readData() {
    DocumentReference dataUrl =
        FirebaseFirestore.instance.collection('library').doc(id);

    dataUrl.get().then((payload) {
      Map<String, dynamic> getData = payload.data();

      String getId = getData['bookId'];
      String getName = getData['bookName'];
      String getCategory = getData['bookCategory'];
      String getPageCount = getData['bookPageCount'];

      Fluttertoast.showToast(
          msg: 'Id: ' +
              getId +
              ' Name: ' +
              getName +
              ' Category: ' +
              getCategory +
              ' Page count: ' +
              getPageCount);
    });
  }

  //----- edit data in firebase ---
  void editData() {
    DocumentReference dataUrl =
        FirebaseFirestore.instance.collection('library').doc(id);

    Map<String, dynamic> editData = {
      'bookId': id,
      'bookName': name,
      'bookCategory': category,
      'bookPageCount': pageCount.toString(),
    };

    dataUrl.update(editData).whenComplete(() {
      Fluttertoast.showToast(msg: 'Edit book with ID: ' + id);
    });
  }

  //----- delet data in firebase ---
  void deletData() {
    DocumentReference dataUrl =
        FirebaseFirestore.instance.collection('library').doc(id);

    dataUrl.delete().whenComplete(() {
      Fluttertoast.showToast(msg: 'Delet book with ID: ' + id);
    });
  }
}
