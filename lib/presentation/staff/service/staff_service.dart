import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/presentation/staff/model/staff.dart';

class StaffService {
  late ApiDioClient apiDioClient = ApiDioClient();
  String api = '$baseUrl/staff';
  String token = tokenApi;

  Future<List<Staff>?> staffFloor() async {
    try {
      final response = await apiDioClient.dio.get(
        "$api?per_page=20",
        options: Options(
          headers: {"x-jwt-token-key": token},
        ),
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

  Future createStaff(Staff staff) async {
    try {
      var reqData = jsonEncode(Staff.toJson(staff));
      if (kDebugMode) {
        print('request data: $reqData');
      }

      var res = await apiDioClient.dio.post(
        api,
        data: reqData,
        options: Options(
          headers: {"x-jwt-token-key": token},
        ),
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
