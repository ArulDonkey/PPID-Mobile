// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/configs/route.config.dart';
import 'package:ppid_mobile/screens/splash_screen.dart';

void main() async {
  runApp(MyApp());
  // await NetworkChecker().execute(InternetConnectionChecker());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouteConfig routeConfig = RouteConfig();

    return MaterialApp(
      title: 'PPID UIN Sunan Gunung Djati Bandung',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: routeConfig.onGenerateRoute,
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
