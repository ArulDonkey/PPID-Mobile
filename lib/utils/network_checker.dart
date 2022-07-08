// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  static final NetworkChecker _instance = NetworkChecker();
  static NetworkChecker get instance => _instance;
  bool isOnline = false;

  Connectivity connectivity = Connectivity();
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  StreamController streamController = StreamController();
  Stream get stream => streamController.stream;

  void init() async {
    connectivityResult = await connectivity.checkConnectivity();
    connectivity.onConnectivityChanged.listen((_) {
      checkConnection();
    });
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
        // Fluttertoast.showToast(
        //   msg: "Terhubung",
        //   toastLength: Toast.LENGTH_SHORT,
        // );
      } else {
        isOnline = false;
        // Fluttertoast.showToast(
        //   msg: "Terputus",
        //   toastLength: Toast.LENGTH_SHORT,
        // );
      }
    } on SocketException catch (_) {
      isOnline = false;
      // Fluttertoast.showToast(
      //   msg: "Terputus",
      //   toastLength: Toast.LENGTH_SHORT,
      // );
    }

    log("NETWORK STATUS: $isOnline");
    // streamController.sink.add({result: isOnline});

    return isOnline;
  }

  void dispose() => streamController.close();
}
