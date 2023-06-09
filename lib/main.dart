// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/configs/route.config.dart';
import 'package:ppid_mobile/screens/splash_screen.dart';
import 'package:ppid_mobile/utils/network_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
} 

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NetworkChecker _networkChecker = NetworkChecker.instance;

  @override
  void initState() {
    _networkChecker.init();
    super.initState();
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }

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
