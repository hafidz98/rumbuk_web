import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/presentation/building_v_2/model/building.dart';

class BuildingService{
  late ApiDioClient apiDioClient = ApiDioClient();
  String buildingApi = '$baseUrl/building';

  Future<List<Building>?> fetchBuilding() async {
    try {
      final response = await apiDioClient.dio.get(
        buildingApi,
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

  Future createBuilding(Building building) async {
    try {
      var reqData = jsonEncode(Building.toJson(building));
      if (kDebugMode) {
        print('request data: $reqData');
      }

      var res = await apiDioClient.dio.post(
        buildingApi,
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
