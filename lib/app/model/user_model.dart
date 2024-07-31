import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json/json.dart';
// already is flutter 3.24
// @JsonCodable()
class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    name = doc["name"];
    email = doc["email"];
  }


}