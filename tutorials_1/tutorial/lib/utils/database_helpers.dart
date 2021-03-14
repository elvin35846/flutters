import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tutorial/models/studentModels.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _studentTable = 'student';
  String _columnID = 'id';
  String _columnName = 'name';
  String _columnActive = 'active';

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      print("DBHelper is null");
      return _databaseHelper;
    } else {
      print("DBHelper is not null");
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      print("DB is null,  will be created");
      _database = await _initializeDatabase();
      return _database;
    } else {
      print("DB is not null, the created one will be used");
      return _database;
    }
  }

  _initializeDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String dbPath = join(folder.path, 'students.db');
    print("DB Path: $dbPath");

    var studentDB = openDatabase(dbPath, version: 1, onCreate: _createDB);

    return studentDB;
  }

  Future<void> _createDB(Database db, int version) async {
    print("Created DB Table");
    await db.execute(
        "CREATE TABLE $_studentTable($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnName TEXT, $_columnActive INTEGER )");
  }

  Future<int> addStudent(Students student) async {
    var db = await _getDatabase();
    var result = await db.insert(
        _studentTable, student.convertToMapForWriteDB(),
        nullColumnHack: "$_columnID");
    print("Add student in DB: " + result.toString());
    return result;
  }

  Future<List<Map<String, dynamic>>> allStudents() async {
    var db = await _getDatabase();
    var resutl = await db.query(_studentTable, orderBy: "$_columnID DESC");
    return resutl;
  }

  Future<int> editStudent(Students std) async {
    var db = await _getDatabase();
    var res = await db.update(_studentTable, std.convertToMapForWriteDB(),
        where: '$_columnID = ?', whereArgs: [std.id]);
    return res;
  }

  Future<int> deleteStudent(int id) async {
    var db = await _getDatabase();
    var res = await db
        .delete(_studentTable, where: '$_columnID = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllStudents() async {
    var db = await _getDatabase();
    var res = await db.delete(_studentTable);
    return res;
  }
}
