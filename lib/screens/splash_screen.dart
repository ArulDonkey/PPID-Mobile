// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/screens/base_screen.dart';
import 'package:ppid_mobile/screens/base_screen_argument.dart';
import 'package:ppid_mobile/screens/onboarding_screen.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PpidSharedPreferences _prefs = PpidSharedPreferences();
  bool? _isFirstLaunch;

  @override
  void initState() {
    isFirstLauch();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            if (!_isFirstLaunch!) {
              return BaseScreen(
                argument: BaseScreenArgument(index: 0),
              );
            } else {
              return OnboardingScreen();
            }
          }),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundedContainer(
        child: Center(
          child: Image.asset("assets/images/ppid_logo.png"),
        ),
      ),
    );
  }

  isFirstLauch() async {
    var x = await _prefs.getFirstLaunchValue();
    _isFirstLaunch = x;
  }
}
