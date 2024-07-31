import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json/json.dart';
// already is flutter 3.24
// @JsonCodable()
class UserModel {
  String? id;
  String? userName;
  String? email;

  UserModel({this.id, this.userName, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    userName = doc["userName"];
    email = doc["email"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "email": email,
  };
}