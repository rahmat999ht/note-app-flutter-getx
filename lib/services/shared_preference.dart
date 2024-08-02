
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
  String? get getIdLogin {
    return _prefs?.getString(KeysPref.idLogin);
  }

  /// for storing idLogin to app
  Future<void> putIdLogin(String idLogin) async {
    await _prefs?.setString(KeysPref.idLogin, idLogin);
  }

  Future<void> removeIdLogin() async {
    await _prefs?.remove(KeysPref.idLogin);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _prefs?.clear();
  }
}