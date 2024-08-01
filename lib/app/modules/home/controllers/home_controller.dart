import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/services/firestore.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';

import '../../../../models/note_model.dart';

class HomeController extends GetxController with StateMixin<List<NoteModel>> {
  final prefService = PrefService();
  final database = Database();
  Rx<int> axisCount = 2.obs;
  List<NoteModel> noteList = <NoteModel>[];
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
    String uid = prefService.getIdCustomer!;
    log("NoteController onit :: $uid");
    database.noteStream(uid).listen((v) {
      if (v.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        noteList = value!;
        log(noteList.toString(), name: "isi list");
        change(noteList, status: RxStatus.success());
      }
    }).onError((e) {
      change(null, status: RxStatus.error(e));
    });
    super.onReady();
  }
}
