import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/presentation/timeslot/model/timeslot.dart';

class TimeSlotService{
  late ApiDioClient apiDioClient = ApiDioClient();

  Future<List<TimeSlot>?> fetchTimeSlot() async {
    try {
      final response = await apiDioClient.dio.get(
        '$baseUrl/timeslot',
      );

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: response.statusCode!,
          message: response.statusMessage,
        );
      }

      var data = ApiResponse.fromJson(jsonDecode(response.data));

      return data.data;
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }

  Future createTimeSlot(TimeSlot timeSlot) async {
    try {
      var reqData = jsonEncode(TimeSlot.toJson(timeSlot));
      if (kDebugMode) {
        print('request data Timeslot: $reqData');
      }

      var res = await apiDioClient.dio.post(
        '$baseUrl/timeslot',
        data: reqData,
      );

      if (res.statusCode != null && res.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: res.statusCode!,
          message: res.statusMessage,
        );
      }
      return true;
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }
}
