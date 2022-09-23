import 'dart:convert';

import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PpidSharedPreferences {
  setFirstLaunchValue(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isFirstLaunch", value);
  }

  getFirstLaunchValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isFirstLaunch = sharedPreferences.getBool("isFirstLaunch");

    return isFirstLaunch;
  }

  setCurrentUserValue(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user', jsonEncode(user));
  }

  getCurrentUserValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var currentUser = sharedPreferences.getString('user');

    return currentUser;
  }
}
