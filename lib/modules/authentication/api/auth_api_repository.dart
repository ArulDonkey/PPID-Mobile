// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:ppid_mobile/configs/api.config.dart';

class AuthApiRepository {
  final String _baseUrl = ApiConfig.baseUrl;

  Future<http.Response> signUp({body, filePath}) async {
    try {
      final Uri uri = Uri.parse("$_baseUrl/auth/register");
      // var request = http.MultipartRequest("POST", uri);
      // request.files.add(http.MultipartFile.fromBytes(
      //   "ktp",
      //   await File.fromUri(filePath).readAsBytes(),
      // ));
      http.Response response = await http.post(
        uri,
        body: body,
      );

      // request.send().then((response) {
      //   if (response.statusCode == 200) {
      //     log("File uploaded");
      //   }
      // });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> signIn({body}) async {
    try {
      final Uri uri = Uri.parse("$_baseUrl/auth/login");
      http.Response response = await http.post(
        uri,
        body: body,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
