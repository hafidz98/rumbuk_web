import 'package:dio/dio.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/data/network/entity/api_response_entity.dart';
// import 'package:rumbuk_web/data/network/entity/room_entity.dart';

import 'package:rumbuk_web/domain/exception/network_exception.dart';

class RoomRepository {
  late ApiDioClient apiDioClient = ApiDioClient();

  //RoomRepository();
  //final instance = RoomRepository();

  Future<ApiResponseEntity> getAllRoom() async {
    try {
      final response = await apiDioClient.dio.get(roomApiEndpoint);

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: response.statusCode!,
          message: response.statusMessage,
        );
      }

      return ApiResponseEntity.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}

// TODO: Room repository -> copy building repo
// TODO: Apiresponse wrapper [Done?]
