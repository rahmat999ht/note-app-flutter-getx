import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/services/firestore.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';

class AddNoteController extends GetxController {
  final database = Database();
  final prefServices = PrefService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final isLoading = false.obs;

  void stateLoading() => isLoading.value = !isLoading.value;

  void save() {
    if (titleController.text.isEmpty && bodyController.text.isEmpty) {
      Get.defaultDialog(
        title: "info",
        middleText: "Isi semua form terlebih dahulu",
      );
    } else {
      stateLoading();
      database.addNote(prefServices.getIdLogin!, titleController.text,
          bodyController.text).then(
            (v) {
          Get.snackbar('info', "Catatan berhasil di tambah");
          stateLoading();
        },
      );
      Get.back();
    }
  }

  @override
  void onInit() {
    prefServices.prefInit();
    super.onInit();
  }
}
