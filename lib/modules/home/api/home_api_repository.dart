import 'dart:developer';

import 'package:dio/dio.dart';

class HomeApiRepository {
  final Dio _dio = Dio();

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
      log(e.toString());
      return e.response!.data;
    }
  }

  Future<Response> getBeritaPPID({
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response = await _dio.get(
        "https://ppid.uinsgd.tech/api/posts",
        queryParameters: params,
      );

      return response;
    } on DioError catch (e) {
      log(e.toString());

      return e.response!.data;
    }
  }
}
