import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
//import 'package:id_rumbuk_app/exception/network.exception.dart';
//import 'package:id_rumbuk_app/model/dto/api.config.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/presentation/reservation/addon/dto/avail_room_response.dart';
import 'package:rumbuk_web/presentation/reservation/addon/dto/building_response.dart';

class ReservationService extends GetConnect {
  final String apiEndpoint = baseUrl;

  Future<BuildingResponse> fetchBuilding(String? token) async {
    Map<String, String> requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    try {
      final response = await get('$apiEndpoint/building',
          headers: requestHeader);

      if (response.statusCode != null && response.statusCode! >= 400) {
        return throw NetworkExcepton(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
      return BuildingResponse.fromJson(response.body);
    } catch (e) {
      return throw GetHttpException(e.toString());
    }
  }

  Future<AvailableRoomResponse> fetchRoom(String? token, String date) async {
    final requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    final queryParam = {
      'date' : date,
    };

    try {
      final response = await get('$apiEndpoint/available-room', headers: requestHeader, query: queryParam);

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
      return AvailableRoomResponse.fromJson(response.body);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> createReservation(String? token, req) async {
    var requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    printInfo(info: '> createReservation(): [reqdata]:$req');
    // $apiEndpoint${ApiConfig.reservation}

    try {
      final response = await post('$apiEndpoint/reservation', req, headers: requestHeader);

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
    } catch (e) {
      throw FormatException(e.toString());
    }
  }
}
