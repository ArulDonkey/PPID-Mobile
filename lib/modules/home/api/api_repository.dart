import 'package:dio/dio.dart';

class HomeApiRepository {
  final Dio _dio = Dio();

  Future<Response> getBeritaUIN({
    Map<String, dynamic>? params,
  }) async {
    Response response = await _dio.get(
      "https://uinsgd.ac.id/wp-json/wp/v2/posts",
      queryParameters: params,
    );

    return response;
  }
}
