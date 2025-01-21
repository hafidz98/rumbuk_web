import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/presentation/building/model/building.dart';

class BuildingService extends GetConnect {
  final String api = '$baseUrl/building';

  Future<List<TimeSlot>?> fetchBuilding(String? token) async {
    Map<String, String> requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    try {
      final response = await get(api, headers: requestHeader);

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkExcepton(
            statusCode: response.statusCode!, message: response.statusText);
      }

      final apiResponse = ApiResponse.fromJson(response.body);

      // if (kDebugMode) {
      //   print(apiResponse.data);
      // }
      printInfo(info: apiResponse.toString());

      return apiResponse.data;
    } catch (e) {
      return throw GetHttpException(e.toString());
    }
  }
}
