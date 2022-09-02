// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:ppid_mobile/configs/api.config.dart';

class AuthApiRepository {
  final String _baseUrl = ApiConfig.baseUrl;

  Future<http.Response> signUp({body}) async {
    try {
      final Uri uri = Uri.parse("$_baseUrl/auth/register");
      http.Response response = await http.post(
        uri,
        body: body,
      );

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
