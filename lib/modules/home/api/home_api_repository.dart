import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ppid_mobile/configs/api.config.dart';

class HomeApiRepository {
  final Dio _dio = Dio();
  final String _baseUrl = ApiConfig.baseUrl;

  Future<Response> getBeritaUIN({
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response = await _dio.get(
        "https://uinsgd.ac.id/wp-json/wp/v2/posts",
        queryParameters: params,
      );

      return response;
    } on DioError catch (e) {
      log("$e");
      return e.response!.data;
    }
  }

  Future<Response> getBeritaPPID({
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response = await _dio.get(
        "$_baseUrl/posts",
        queryParameters: params,
      );

      return response;
    } on DioError catch (e) {
      log("$e");

      return e.response!.data;
    }
  }
}
