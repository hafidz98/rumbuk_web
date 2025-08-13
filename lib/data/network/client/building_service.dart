import 'package:dio/dio.dart';
import 'package:rumbuk_web/data/network/client/api_client.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/data/network/entity/building_entity.dart';

class BuildingService{
  late ApiService as;

  BuildingService({required this.as});

  Future<BuildingResponse> getBuildings() async {
    final response = await as.dio.get('/rumbuk/building', options: Options(contentType: 'application/json'));
    //dio.get('/rumbuk/building')

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

// TODO: jadi building repository di folder network/repository