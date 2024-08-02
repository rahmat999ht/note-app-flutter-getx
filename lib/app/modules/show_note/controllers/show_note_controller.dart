import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app_flutter_getx_firebase/services/firestore.dart';

import '../../../../models/note_model.dart';
import '../../../../services/shared_preference.dart';

class ShowNoteController extends GetxController with StateMixin<NoteModel> {
  final prefServices = PrefService();
  final database = Database();

  NoteModel? noteData;

  // late int index;
  final time = ''.obs;
  final formattedDate = ''.obs;
  final isLoading = false.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void stateLoading() => isLoading.value = !isLoading.value;

  Future<void> save() async {
    if (titleController.text != noteData!.title ||
        bodyController.text != noteData!.body) {
      stateLoading();

      database
          .updateNote(
        prefServices.getIdLogin!,
        titleController.text,
        bodyController.text,
        noteData!.id!,
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
        database.delete(prefServices.getIdLogin!, noteData!.id!).then((v) {
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
    prefServices.prefInit();
    if (noteData == null) {
      change(NoteModel.fromJson({}), status: RxStatus.empty());
    } else if (noteData != null) {
      log(noteData!.toJson().toString(), name: "noteData");
      change(noteData, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
    super.onInit();
  }

  @override
  void onReady() {
    titleController.text = noteData!.title!;
    bodyController.text = noteData!.body!;
    formattedDate.value =
        DateFormat.yMMMd().format(noteData!.creationDate!.toDate());
    time.value = DateFormat.jm().format(noteData!.creationDate!.toDate());

    super.onReady();
  }
}
