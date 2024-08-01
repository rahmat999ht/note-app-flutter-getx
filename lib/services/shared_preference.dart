
import 'package:shared_preferences/shared_preferences.dart';

import '../keys/pref.dart';

class PrefService {
  SharedPreferences? _prefs;

  PrefService() {
    prefInit();
  }

  Future<void> prefInit() async {
    _prefs = _prefs ?? await SharedPreferences.getInstance();
  }

  bool get isFirstInstall {
    final prefBool = _prefs?.getString(KeysPref.firstInstall);
    return prefBool != null ? false : true;
  }

  /// Set first install
  void setNotFirstInstall() {
    _prefs?.setString(KeysPref.firstInstall, 'false');
  }

  /// for getting string from box
  String? get getEmailLogin {
    return _prefs?.getString(KeysPref.emailLogin);
  }

  /// for storing token to app
  Future<void> putEmailLogin(String email) async {
    await _prefs?.setString(KeysPref.emailLogin, email);
  }

  Future<void> removeEmailLogin() async {
    await _prefs?.remove(KeysPref.emailLogin);
  }

  /// for getting string from box
  String? get getIdCustomer {
    return _prefs?.getString(KeysPref.idCustomer);
  }

  /// for storing idCustomer to app
  Future<void> putIdCustomer(String idCustomer) async {
    await _prefs?.setString(KeysPref.idCustomer, idCustomer);
  }

  Future<void> removeIdCustomer() async {
    await _prefs?.remove(KeysPref.idCustomer);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _prefs?.clear();
  }
}