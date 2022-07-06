// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NetworkChecker {
  StreamController<ConnectivityResult> connectionController =
      StreamController<ConnectivityResult>();

  NetworkChecker() {
    Connectivity().onConnectivityChanged.listen((event) {
      connectionController.add(event);
    });
  }

  String getConnectionValue(var connectivityResult) {
    String status = '';
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        status = 'Mobile';
        Fluttertoast.showToast(
          msg: "Connected",
          toastLength: Toast.LENGTH_SHORT,
        );
        break;
      case ConnectivityResult.wifi:
        status = 'Wi-Fi';
        Fluttertoast.showToast(
          msg: "Connected",
          toastLength: Toast.LENGTH_SHORT,
        );
        break;
      case ConnectivityResult.none:
        status = 'None';
        Fluttertoast.showToast(
          msg: "Not connected",
          toastLength: Toast.LENGTH_SHORT,
        );
        break;
      default:
        status = 'None';
        Fluttertoast.showToast(
          msg: "Not connected",
          toastLength: Toast.LENGTH_SHORT,
        );
        break;
    }

    log(status);

    return status;
  }

  String checkConnection() {
    var connectivityResult = Provider.of<ConnectivityResult>;
    var connectionStatus = getConnectionValue(connectivityResult);

    return connectionStatus;
  }
}
