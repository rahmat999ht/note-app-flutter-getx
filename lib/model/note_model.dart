import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String? id;
  String? title;
  String? body;
  Timestamp? creationDate;

  NoteModel({this.id, this.title, this.body, this.creationDate});

  NoteModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    title = doc['title'];
    body = doc["body"];
    creationDate = doc["creationDate"];
  }

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json["body"];
    creationDate = json["creationDate"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "creationDate": creationDate,
  };
}