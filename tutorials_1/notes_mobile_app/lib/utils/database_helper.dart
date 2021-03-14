import 'dart:io';

import 'package:flutter/services.dart';
import 'package:notes_mobile_app/models/categories.dart';
import 'package:notes_mobile_app/models/notes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var lock = Lock();
    Database _db;

    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databsePath = await getDatabasesPath();
          var path = join(databsePath, "appDB.db");
          print("Database path: " + path);
          var file = new File(path);

          if (!await file.exists()) {
            ByteData data = await rootBundle.load(join("assets", "notes.db"));
            List<int> bytes =
                data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            await new File(path).writeAsBytes(bytes);
          }

          _db = await openDatabase(path);
        }
      });
    }
    return _db;
  }

  // For Categories

  Future<List<Map<String, dynamic>>> getCategories() async {
    var db = await _getDatabase();
    var res = await db.query("Categories");
    return res;
  }

  Future<int> addCategories(Categories category) async {
    var db = await _getDatabase();
    var res = await db.insert("Categories", category.toMap());

    return res;
  }

  Future<int> editCategory(Categories category) async {
    var db = await _getDatabase();
    var res = await db.update("Categories", category.toMap(),
        where: 'categoriesID = ?', whereArgs: [category.categoriesID]);

    return res;
  }

  Future<int> deletCategory(int categoriesID) async {
    var db = await _getDatabase();
    var res = await db.delete("Categories",
        where: 'categoriesID = ?', whereArgs: [categoriesID]);
    return res;
  }

  // For Notes

  Future<List<Map<String, dynamic>>> getNotes() async {
    var db = await _getDatabase();
    var res = await db.query("Notes", orderBy: 'ID DESC');

    return res;
  }

  Future<int> addNote(Notes note) async {
    var db = await _getDatabase();
    var res = db.insert("Notes", note.toMap());
    return res;
  }

  Future<int> noteEdit(Notes note) async {
    var db = await _getDatabase();
    var res = await db
        .update("Notes", note.toMap(), where: 'ID = ?', whereArgs: [note.id]);
    return res;
  }

  Future<int> noteDelete(int id) async {
    var db = await _getDatabase();
    var res = db.delete("Notes", where: 'ID = ?', whereArgs: [id]);
    return res;
  }
}
