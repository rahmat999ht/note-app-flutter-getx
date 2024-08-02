import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app_flutter_getx_firebase/services/firestore.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';

import '../../../../models/note_model.dart';

class ShowNoteController extends GetxController {
  // final prefServices = PrefService();
  final database = Database();

  late NoteModel noteData;

  // late int index;
  final time = ''.obs;
  final formattedDate = ''.obs;
  final isLoading = false.obs;
  String idLogin = '';
  String idNote = '';

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void stateLoading() => isLoading.value = !isLoading.value;

  Future<void> save() async {
    if (titleController.text != noteData.title ||
        bodyController.text != noteData.body) {
      stateLoading();
      log(idLogin, name: "idLogin");
      log(idNote, name: "idNote");

      database
          .updateNote(
        idLogin,
        titleController.text,
        bodyController.text,
        idNote,
      )
          .then(
        (v) {
          Get.snackbar('info', "Catatan berhasil di update");
          stateLoading();
        },
      );
      log(titleController.text, name: "value form");
      log(bodyController.text, name: "value form");
      titleController.clear();
      bodyController.clear();
      return Get.back();
    } else {
      return Get.defaultDialog(
        title: 'info',
        middleText: "Content tidak boleh sama deangan yang sebelumnya",
      );
    }
  }

  void showDialogDelete() {
    Get.defaultDialog(
      title: "Hapus Note?",
      middleText: "apa anda yakin ingin menghapus note ini?",
      onConfirm: () {
        Get.back();
        stateLoading();
        database.delete(idLogin, idNote).then((v) {
          Get.snackbar('info', "Catatan berhasil di hapus");
          stateLoading();
        });
        Get.back(closeOverlays: true);
      },
    );
  }

  @override
  void onInit() {
    noteData = Get.arguments['data'];
    idLogin = Get.arguments['idLogin'];
    idNote = noteData.id ?? "0";

    log(idLogin, name: "idLogin");
    log(idNote, name: "idNote");
    log(noteData.toJson().toString(), name: "noteData");
    // prefServices.prefInit();
    super.onInit();
  }

  @override
  void onReady() {
    titleController.text = noteData.title!;
    bodyController.text = noteData.body!;
    formattedDate.value =
        DateFormat.yMMMd().format(noteData.creationDate!.toDate());
    time.value = DateFormat.jm().format(noteData.creationDate!.toDate());

    super.onReady();
  }
}
