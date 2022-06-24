// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/modules/home/home_screen.dart';
import 'package:ppid_mobile/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPID UIN Sunan Gunung Djati Bandung',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "home": (context) => HomeScreen(),
      },
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      scrollBehavior: MyBehavior(),
      home: SplashScreen(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
