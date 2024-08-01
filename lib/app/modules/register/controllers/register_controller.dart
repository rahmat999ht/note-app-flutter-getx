import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/app/routes/app_pages.dart';

import '../../../../models/user_model.dart';
import '../../../../services/auth.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final authServices = AuthServices();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirPassword = TextEditingController();

  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  final isObscure = true.obs;
  final isObscureConfir = true.obs;

  void stateObscure() => isObscure.value = !isObscure.value;

  void stateObscureConfir() => isObscureConfir.value = !isObscureConfir.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future register() async {
    try {
      final error = formKey.currentState!.validateGranularly().toList();
      if (error.isNotEmpty) {
        return Get.snackbar("info", "form error sebanyak ${error.length}");
      }
      authServices.register(name.text, email.text, password.text).then((v) {
        _clearControllers();
        Get.toNamed(Routes.LOGIN);
      });
    } catch (e) {
      Get.snackbar(
        'Error creating account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
    confirPassword.clear();
  }

  bool nullValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  String? validateUserName(String? value) {
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

// Fungsi untuk memvalidasi konfirmasi password
  String? validateConfirmPassword(String? confirmPassword) {
    if (nullValidation(confirmPassword)) {
      return 'Konfirmasi kata sandi harap di isi';
    }
    if (password.text != confirmPassword) {
      return 'Kata sandi tidak cocok';
    }
    return null;
  }
}
