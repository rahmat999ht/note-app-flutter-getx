import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String? id;
  String? title;
  String? body;
  Timestamp? creationDate;

  NoteModel({this.id, this.title, this.body, this.creationDate});

  NoteModel.fromMap({required Map<String, dynamic> map, required String id}) {
    id = id;
    title = map['title'];
    body = map["body"];
    creationDate = map["creationDate"];
  }

  factory NoteModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return NoteModel.fromMap(
      id : doc.id,
      map : doc.data() as Map<String, dynamic>,
    );
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