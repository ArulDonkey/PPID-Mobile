// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
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

  @override
  void initState() {
    isFirstLauch();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => OnboardingScreen()),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundedContainer(
        child: Stack(
          children: [
            Center(
              child: Image.asset("assets/images/ppid_logo.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: SpinKitThreeBounce(
                    size: 20,
                    color: Pallete.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  isFirstLauch() async {
    var x = await _prefs.getFirstLaunchValue();
    log('isFirstLaunch: $x');
  }
}
