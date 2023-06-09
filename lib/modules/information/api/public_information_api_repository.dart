import 'package:dio/dio.dart';
import 'package:ppid_mobile/configs/api.config.dart';

class PublicInformationApiRepository {
  final Dio _dio = Dio();
  final String _baseUrl = ApiConfig.baseUrl;

  Future<Response> getPublicInformation({
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response = await _dio.get(
        "$_baseUrl/informasi-publik",
        queryParameters: params,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getInformationPublicType({
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/tipe-informasi-publik',
        queryParameters: params,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
