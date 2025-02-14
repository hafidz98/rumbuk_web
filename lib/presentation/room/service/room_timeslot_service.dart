
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/domain/services/room_service.dart';
import 'package:rumbuk_web/presentation/room/model/room_timeslot_response.dart';

class RoomTimeslotService {
  late ApiDioClient apiDioClient = ApiDioClient();
  String api = baseUrl;

  Future<RoomDataResponse?> fetchRoomWithTimeslot(String roomId) async {
    try {
      final response = await apiDioClient.dio.get(
        "$api\roomId",
      );

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: response.statusCode!,
          message: response.statusMessage,
        );
      }

      if (kDebugMode) {
        print(response.data);
      }

      var data = RoomTimeslotResponse.fromJson(response.data);

      return data.data;
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }
}