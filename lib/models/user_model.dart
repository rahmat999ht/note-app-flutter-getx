import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:json/json.dart';
// already is flutter 3.24
// @JsonCodable()
class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromJson({required Map<String, dynamic> map, required String id}) {
    id = id;
    name = map["name"];
    email = map["email"];
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel.fromJson(
        id : doc.id,
        map : doc.data() as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "email": email,
      };
}