import 'package:shared_preferences/shared_preferences.dart';

class PpisSharedPreferences {
  getFirstLaunchValueSF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isFirstLaunch = sharedPreferences.getBool("isFirstLaunch");

    return isFirstLaunch;
  }

  setFirstLaunchValueSF(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isFirstLaunch", value);
  }
}
