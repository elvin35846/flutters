import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class FileOperations extends StatefulWidget {
  FileOperations({Key key}) : super(key: key);

  @override
  _FileOperationsState createState() => _FileOperationsState();
}

class _FileOperationsState extends State<FileOperations> {
  var textController = TextEditingController();
  Future<String> get getFilePath async {
    Directory folder = await getApplicationDocumentsDirectory();
    debugPrint("Folder path: " + folder.path);
    return folder.path;
  }

  Future<File> get createFile async {
    var createFileFolderPath = await getFilePath;
    return File(createFileFolderPath + "/myFlutterFile.txt");
  }

  Future<String> readeFile() async {
    try {
      var myFile = await createFile;
      String fileBody = await myFile.readAsString();
      return fileBody;
    } catch (exeptions) {
      return "Run with exeptions: $exeptions";
    }
  }

  Future<File> writeFile(String writeStringinFile) async {
    var myFile = await createFile;
    return myFile.writeAsString(writeStringinFile);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("File Operations"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  maxLines: 4,
                  decoration: InputDecoration(hintText: "data save in file"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: _writeFile,
                      color: Colors.green,
                      child: Text("Write to file"),
                    ),
                    RaisedButton(
                      onPressed: _readeFile,
                      color: Colors.green,
                      child: Text("Reade file"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _writeFile() {
    writeFile(textController.text.toString());
  }

  void _readeFile() async {
    debugPrint(await readeFile());
  }
}
