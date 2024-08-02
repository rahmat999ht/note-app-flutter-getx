import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/services/firestore.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';

import '../../../../models/note_model.dart';

class HomeController extends GetxController with StateMixin<List<NoteModel>> {
  final prefService = PrefService();
  final database = Database();
  List<NoteModel> noteList = <NoteModel>[];
  String uid = '';
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;

  final lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100,
    Colors.purpleAccent,
    Colors.greenAccent.shade400,
    Colors.cyanAccent,
  ];

  @override
  void onInit() async {
    prefService.prefInit();
    super.onInit();
  }

  @override
  void onReady() {
    uid = prefService.getIdLogin!;
    log("NoteController onit :: $uid");
    database.noteStream(uid).listen((v) {
      if (v.size == 0) {
        log("empty");
        change([], status: RxStatus.empty());
      } else {
        noteList = List.generate(v.docs.length, (index) {
          final data = v.docs[index];
          log("data Note ${data.data()}");
          log("data id Note ${data.id}");
          return NoteModel.fromDocumentSnapshot(data);
        });
        log("${noteList.toSet()}", name: "isi list");
        change(noteList, status: RxStatus.success());
      }
    }).onError((e) {
      change(null, status: RxStatus.error(e));
    });
    super.onReady();
  }
}
