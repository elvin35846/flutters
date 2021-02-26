import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task({
    this.id,
    this.title,
    this.createdAt,
  });

  String id;
  String title;
  String createdAt;

  factory Task.fromSnapshot(DocumentSnapshot snapshot) => Task(
        id: snapshot.id,
        title: snapshot["title"],
        createdAt: snapshot["createdAt"],
      );
}
