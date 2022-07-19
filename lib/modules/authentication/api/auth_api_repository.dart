import 'package:dio/dio.dart';
import 'package:ppid_mobile/configs/api.config.dart';

class AuthApiRepository {
  final Dio _dio = Dio();
  final String _baseUrl = ApiConfig.baseUrl;

  Future<Response> signUp({body}) async {
    Response response = await _dio.post(
      "$_baseUrl/auth/register",
      data: FormData.fromMap(body),
    );

    return response;
  }
}
