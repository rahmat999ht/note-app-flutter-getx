import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/app/routes/app_pages.dart';
import 'package:note_app_flutter_getx_firebase/models/user_model.dart';
import 'package:note_app_flutter_getx_firebase/services/auth.dart';
import 'package:note_app_flutter_getx_firebase/services/firestore.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';

import '../../../../models/note_model.dart';

class HomeController extends GetxController with StateMixin<ModelDataHome> {
  final prefService = PrefService();
  String idLogin = '';

  final database = Database();
  final auth = AuthServices();
  List<NoteModel> noteList = <NoteModel>[];
  UserModel? user = UserModel();

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

  void logOut() async {
    Get.defaultDialog(
      title: "Peringatan",
      middleText: "Apakah anda yakin ingin log-out?",
      onConfirm: () => auth.logout().then((v) {
        Get.offAllNamed(Routes.LOGIN);
      }),
      onCancel: Get.back,
    );
  }

  @override
  void onInit() async {
    await prefService.prefInit();
    if (Get.arguments != null) {
      idLogin = Get.arguments;
      log(idLogin, name: "idLogin Get.arguments");
    } else {
      idLogin = prefService.getIdLogin!;
      log(idLogin, name: "idLogin prefService");
    }
    super.onInit();
  }

  @override
  void onReady() async {
    // log(email, name: "email");
    final user = await database.getUser(idLogin);
    database.noteStream(idLogin).listen((v) {
      if (user == null && v.size == 0) {
        log("empty");
        change(
            ModelDataHome(
              notes: [],
              user: UserModel.fromMap({}),
            ),
            status: RxStatus.empty());
      } else {
        noteList = List.generate(v.docs.length, (index) {
          final data = v.docs[index];
          log("data Note ${data.data()}");
          log("data id Note ${data.id}");
          return NoteModel.fromDocumentSnapshot(data);
        });
        log("${noteList.toSet()}", name: "isi list");
        change(
          ModelDataHome(
            notes: noteList,
            user: user!,
          ),
          status: RxStatus.success(),
        );
      }
    });
    super.onReady();
  }
}

class ModelDataHome {
  final List<NoteModel> notes;
  final UserModel user;

  ModelDataHome({required this.notes, required this.user});
}
