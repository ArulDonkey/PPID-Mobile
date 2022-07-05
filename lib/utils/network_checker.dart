// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChecker {
  Future<void> execute(
    InternetConnectionChecker internetConnectionChecker,
  ) async {
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (kDebugMode) log(isConnected.toString());

    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            Fluttertoast.showToast(msg: "Terhubung");
            if (kDebugMode) log("terhubung");
            break;
          case InternetConnectionStatus.disconnected:
            Fluttertoast.showToast(msg: "Koneksi terputus");
            if (kDebugMode) log("terputus");
            break;
        }
      },
    );

    // close listener after 30 seconds, so the program doesn't run forever
    await Future<void>.delayed(Duration(seconds: 30));
    await listener.cancel();
  }
}
