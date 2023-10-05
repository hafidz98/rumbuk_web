import 'package:dio/dio.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';

import '../entity/building_entity.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient({
    required String baseUrl,
    required String apiKey,
    required String apiHost,
  }) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.headers = {
        //'x-rumbuk-key': apiKey,
      }
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  Future<BuildingResponse> getBuildings() async {
    final response = await _dio.get('/rumbuk/building');

    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkExcepton(
        statusCode: response.statusCode!,
        message: response.statusMessage,
      );
    } else if (response.statusCode != null) {
      return BuildingResponse.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Unknown error');
    }
  }
}
