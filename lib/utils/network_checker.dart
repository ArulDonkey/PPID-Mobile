import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NetworkChecker {
  static var status = DataConnectionStatus;

  NetworkChecker() {
    DataConnectionChecker().onStatusChange.listen(
      (status) async {
        isOnline(status);
      },
    );
  }
  

  static bool isOnline(DataConnectionStatus status) {
    if (status == DataConnectionStatus.connected) {
      Fluttertoast.showToast(
        msg: "Terhubung kembali ke internet",
        toastLength: Toast.LENGTH_SHORT,
      );

      return true;
    } else if (status == DataConnectionStatus.disconnected) {
      Fluttertoast.showToast(
        msg: "Koneksi internet terputus",
        toastLength: Toast.LENGTH_SHORT,
      );

      return false;
    } else {
      return false;
    }
  }
}
