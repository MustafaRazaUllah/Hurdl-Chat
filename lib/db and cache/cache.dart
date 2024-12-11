import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHandle {
  // Share Pranfrence Cache instance

  // Set userID value in cache
  static Future<void> setUID(String value) async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    try {
      await prefs.setString("userID", value);
      log("Successfully set userID in cache: $value");
    } catch (e) {
      print("❌❌ ${e.toString()}");
    }
  }

  //  Get userID value from cache
  static Future<String> getUID() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    try {
      String? userID = await prefs.getString("userID");
      log("Successfully get userID from cache: $userID");
      return userID ?? "";
    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  // logout user and clear cache
  static Future<void> logout() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    try {
      prefs.remove("userID");
      log("Successfully clear cache");
    } catch (e) {
      print(e.toString());
    }
  }
}
