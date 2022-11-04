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

  checkConnection() async {
    final result = await InternetAddress.lookup('example.com');
    var  connResult = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    try {
      if (connResult) {
        isOnline = connResult;
      } else {
        isOnline = connResult;
      }
    } on SocketException catch (e) {
      log('$e');
      isOnline = connResult;
    }

    isOnline = connResult;

    log("NETWORK STATUS: $connResult");
    log('RESULT: $connResult');
    // log('CONNECTIVITY RESULT: $connectivityResult');

    return isOnline;
  }

  void dispose() => streamController.close();
}
