import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/presentation/reservation/model/reservation_responses.dart';

class ReservationService {
  late ApiDioClient apiDioClient = ApiDioClient();
  String api = '$baseUrl/reservation/all';

  Future<List<ReservationModel>?> fetchAllReservation() async {
    try {
      final response = await apiDioClient.dio.get(
        api,
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

      var data = ReservationResponses.fromRawJson(response.data);

      return data.data;
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }

  // Future createFloor(Reservation floor) async {
  //   try {
  //     var reqData = jsonEncode(Reservation.toJson(floor));
  //     if (kDebugMode) {
  //       print('request data: $reqData');
  //     }
  //
  //     var res = await apiDioClient.dio.post(
  //       api,
  //       data: reqData,
  //     );
  //
  //     if (res.statusCode != null && res.statusCode! >= 400) {
  //       throw NetworkExcepton(
  //         statusCode: res.statusCode!,
  //         message: res.statusMessage,
  //       );
  //     }
  //     return true;
  //   } on DioException catch (e) {
  //     throw HttpException(e.toString());
  //   }
  // }
}
