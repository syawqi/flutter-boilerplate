import 'package:boilerplate/cores/bundle_keys.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? prefs;

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setTheme(bool isDark) async {
    try {
      await prefs!.setBool(BundleKeys.savedTheme, isDark);
      return;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> getTheme() async {
    final theme = prefs!.getBool(BundleKeys.savedTheme);

    return theme ?? true;
  }

  Future<void> setLocale(String lang) async {
    try {
      await prefs!.setString(BundleKeys.savedLocale, lang);
      return;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> getLocale() async {
    final theme = prefs!.getString(BundleKeys.savedLocale);

    return theme ?? "en";
  }
}
