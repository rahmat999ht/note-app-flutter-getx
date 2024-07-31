import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../model/note_model.dart';
import '../model/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userCollection = "users";
  final String noteCollection = "notes";

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(user.id)
          .set(user.toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return true;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(userCollection).doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> addNote(String uid, String title, String body) async {
    try {
      var uuid = Uuid().v4();
      final _dataNote = NoteModel(
        id: uuid,
        title: title,
        body: body,
        creationDate: Timestamp.now(),
      );
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(uuid)
          .set(_dataNote.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateNote(
      String uid, String title, String body, String id) async {
    try {
      final _dataNote = NoteModel(
        title: title,
        body: body,
        creationDate: Timestamp.now(),
      );
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .update(_dataNote.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> delete(String uid, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .delete();
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<List<NoteModel>> noteStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(noteCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NoteModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(NoteModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
