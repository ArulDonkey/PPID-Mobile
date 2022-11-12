import 'package:dio/dio.dart';
import 'package:ppid_mobile/configs/api.config.dart';

class ApplicationLetterApiRepository {
  final Dio _dio = Dio();
  final String _baseUrl = ApiConfig.baseUrl;

  Future<Response> getInformation({
    Map<String, dynamic>? params,
    required dynamic token,
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/permohonan-informasi-publik',
        queryParameters: params,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> requestInformation({
    Map<String, dynamic>? body,
    required dynamic token,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl/permohonan-informasi-publik',
        data: body,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
