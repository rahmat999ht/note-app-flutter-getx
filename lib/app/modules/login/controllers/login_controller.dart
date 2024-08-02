import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/app/routes/app_pages.dart';
import 'package:note_app_flutter_getx_firebase/services/auth.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final authServices = AuthServices();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String usersCollection = "users";
  final isObscure = true.obs;

  void stateObscure() => isObscure.value = !isObscure.value;

  void toSingUp() => Get.toNamed(Routes.REGISTER);

  Future login() async {
    try {
      final error = formKey.currentState!.validateGranularly().toList();
      if (error.isNotEmpty) {
        return Get.snackbar("info", "form error sebanyak ${error.length}");
      }
      log("IN logging in email ${email.text} password ${password.text}");
      await authServices.login(email.text, password.text).then((v) {
        _clearControllers();
      });
    } catch (e) {
      Get.snackbar(
        'Error logging in',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    email.clear();
    password.clear();
  }

  bool nullValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  String? validateName(String? value) {
    if (nullValidation(value)) {
      return 'Nama harap di isi';
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (nullValidation(email)) {
      return 'Email harap di isi';
    }
    // Regex untuk validasi email
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email!)) {
      return 'Format email tidak valid';
    }
    return null;
  }

// Berfungsi untuk memvalidasi password
  String? validatePassword(String? password) {
    // Reset pesan kesalahan
    String errorMessage = '';
    // Panjang kata sandi lebih dari 6
    if (password!.length < 8) {
      errorMessage += 'Kata sandi minimal 8 karakter.\n';
    }
    // Berisi setidaknya satu huruf besar
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errorMessage += '• Huruf besar tidak ada.\n';
    }
    // Berisi setidaknya satu huruf kecil
    if (!password.contains(RegExp(r'[a-z]'))) {
      errorMessage += '• Huruf kecil tidak ada.\n';
    }
    // Berisi setidaknya satu digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      errorMessage += '• Angka tidak ada.\n';
    }
    // Berisi setidaknya satu karakter khusus
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      errorMessage += '• Karakter khusus tidak ada.\n';
    }
    // Jika tidak ada pesan kesalahan, kata sandi valid
    if (errorMessage.isEmpty) {
      return null;
    } else {
      return errorMessage;
    }
  }
}
