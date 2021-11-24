import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';


class PrefManager {
  static final PrefManager _singleton = PrefManager._internal();

  factory PrefManager() {
    return _singleton;
  }

  PrefManager._internal();

   read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key) !=null){
    return json.decode(prefs.getString(key));
    }

    return null;
  }

  save(String key, value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, json.encode(value));
    } catch (ex) {
      print(ex);
    }
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('user')) {
         await remove('user');

      }
    } catch (e) {
      print(e);
    }
  }

  
}
