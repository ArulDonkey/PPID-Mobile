// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:ppid_mobile/configs/api.config.dart';

class AuthApiRepository {
  final String _baseUrl = ApiConfig.baseUrl;

  Future<http.Response> signUpLembaga(
      {body, fileKtp, fileSk, fileAdArt, fileSkNegara}) async {
    try {
      final Uri uri = Uri.parse("$_baseUrl/auth/register");
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath('ktp', fileKtp));
      request.files.add(await http.MultipartFile.fromPath('sk', fileSk));
      request.files.add(await http.MultipartFile.fromPath('adart', fileAdArt));
      request.files
          .add(await http.MultipartFile.fromPath('sk_negara', fileSkNegara));
      var sendRequest = await request.send();
      var response = await http.Response.fromStream(sendRequest);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> signUpIndividu({body, file}) async {
    try {
      final Uri uri = Uri.parse("$_baseUrl/auth/register");
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath('ktp', file));
      var sendRequest = await request.send();
      var response = await http.Response.fromStream(sendRequest);

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
