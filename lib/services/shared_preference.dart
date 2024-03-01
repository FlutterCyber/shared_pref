import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPrefService {
  static Future<bool> saveObject(
      {required var object, required String objectKey}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringObj = jsonEncode(object);
    bool isSaved = await prefs.setString(objectKey, stringObj);
    return isSaved;
  }

  static Future<User> getUserObject() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? stringUser = prefs.getString("user");
    Map<String, dynamic> studentMap = jsonDecode(stringUser!);
    User user = User.fromJson(studentMap);
    return user;
  }
}
