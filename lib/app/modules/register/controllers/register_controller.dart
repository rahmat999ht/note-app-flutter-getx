import 'package:get/get.dart';

class RegisterController extends GetxController {
  // bool nullValidation(String? value) {
  //   if (value == null || value.trim().isEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // String _validateName(String name) {
  //   if (nullValidation(name)) {
  //     return isNameMessage.value = 'Nama harap di isi';
  //   }
  //   return isNameMessage.value = '';
  // }
  //
  // String _validateEmail(String email) {
  //   if (nullValidation(email)) {
  //     return isEmailMessage.value = 'Email harap di isi';
  //   }
  //   // Regex untuk validasi email
  //   String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(email)) {
  //     return isEmailMessage.value = 'Format email tidak valid';
  //   }
  //   return isEmailMessage.value = '';
  // }
  //
  // // Berfungsi untuk memvalidasi password
  // String _validatePassword(String password) {
  //   // Reset pesan kesalahan
  //   String errorMessage = '';
  //   // Panjang kata sandi lebih dari 6
  //   if (password.length < 8) {
  //     errorMessage += 'Kata sandi minimal 8 karakter.\n';
  //   }
  //   // Berisi setidaknya satu huruf besar
  //   if (!password.contains(RegExp(r'[A-Z]'))) {
  //     errorMessage += '• Huruf besar tidak ada.\n';
  //   }
  //   // Berisi setidaknya satu huruf kecil
  //   if (!password.contains(RegExp(r'[a-z]'))) {
  //     errorMessage += '• Huruf kecil tidak ada.\n';
  //   }
  //   // Berisi setidaknya satu digit
  //   if (!password.contains(RegExp(r'[0-9]'))) {
  //     errorMessage += '• Angka tidak ada.\n';
  //   }
  //   // Berisi setidaknya satu karakter khusus
  //   if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
  //     errorMessage += '• Karakter khusus tidak ada.\n';
  //   }
  //   // Jika tidak ada pesan kesalahan, kata sandi valid
  //   if (errorMessage.isEmpty) {
  //     return isPasswordMessage.value = '';
  //   } else {
  //     return isPasswordMessage.value = errorMessage;
  //   }
  // }
  //
  // // Fungsi untuk memvalidasi konfirmasi password
  // String _validateConfirmPassword(String password, String confirmPassword) {
  //   if (nullValidation(confirmPassword)) {
  //     return isKomfirPassMessage.value = 'Konfirmasi kata sandi harap di isi';
  //   }
  //   if (password != confirmPassword) {
  //     return isKomfirPassMessage.value = 'Kata sandi tidak cocok';
  //   }
  //   return isKomfirPassMessage.value = '';
  // }
}
