import 'dart:convert';

import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PpidSharedPreferences {
  setFirstLaunchValue(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isFirstLaunch", value);
  }

  getFirstLaunchValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isFirstLaunch = sharedPreferences.getBool("isFirstLaunch");

    return isFirstLaunch ?? true;
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

  removeCurrentUserValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('user');
  }

  saveBeritaUins(List<BeritaUin> list) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('beritaUins', jsonEncode(list));
  }

  getBeritaUins() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var beritaUins = sharedPreferences.getString('beritaUins');

    return beritaUins;
  }

  saveBeritaPpids(List<BeritaPpid> list) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('beritaPpids', jsonEncode(list));
  }

  getBeritaPpids() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var beritaPpids = sharedPreferences.getString('beritaPpids');

    return beritaPpids;
  }
}
