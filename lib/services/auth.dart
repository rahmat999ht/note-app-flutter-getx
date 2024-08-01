import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';

import '../models/user_model.dart';
import 'firestore.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  final prefServices = PrefService();
  final database = Database();

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Future<void> login(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      prefServices.prefInit();
      await prefServices.putIdCustomer(userCredential.user!.uid).then((v) {
        log(userCredential.user!.uid, name: "id userCredential");
        return Get.snackbar('Info', "anda berhasil login");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('no user found for that email');
        return Get.defaultDialog(
          title: 'Info',
          middleText: 'Akun email anda belum terdaftar',
          onConfirm: () {
            Get.back(); // close dialog
          },
          textConfirm: 'Ya',
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user');
        return Get.defaultDialog(
          title: 'Info',
          middleText:
              'Akun email anda sudah terdaftar, namun password yang ada masukkan salah',
          onConfirm: () {
            Get.back(); // close dialog
          },
          textConfirm: 'Ya',
        );
      }
    } catch (e) {
      log(e.toString());
      return Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Anda tidak bisa login',
      );
    }
  }

  Future<void> register(String name, String email, String pass) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      UserModel _user = UserModel(
        name: name,
        email: email,
      );
      await database.createNewUser(userCredential.user!.uid, _user).then((v) {
        return Get.snackbar(
          'Info',
          'Akun anda berhasil di daftarkan, silahkan melakukan login !!!',
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('no user found for that email');
        return Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'no user found for that email',
        );
      } else if (e.code == 'weak-password') {
        log('Wrong password provided for that user');
        return Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Wrong password provided for that user',
        );
      }
    } catch (e) {
      log(e.toString());
      return Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Anda tidak bisa memakai akun ini',
      );
    }
  }

  void logout() async {
    await auth.signOut();
    prefServices.removeIdCustomer();
  }
}
