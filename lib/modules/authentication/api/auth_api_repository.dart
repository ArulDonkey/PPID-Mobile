import 'dart:developer';

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

  Future<Response> signIn({body}) async {
    Response response = await _dio.post(
      "$_baseUrl/auth/login",
      data: FormData.fromMap(body),
      options: Options(
        headers: {
          "Accept": "application/json",
        },
        // contentType: "application/x-www-form-urlencoded",
        // contentType: "application/form-data",
      ),
    );

    log("BODY: ${body.toString()}");

    return response;
  }
}
