import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rumbuk_web/data/network/client/api_client.dart';
import 'package:rumbuk_web/data/network/network_mapper.dart';

class ApiInit {
  final log = Logger(
      printer: PrettyPrinter(), level: kDebugMode ? Level.trace : Level.off);
  final apiClient =
      ApiClient(baseUrl: "http://localhost:8991/v1", apiKey: "", apiHost: "");
  NetworkMapper networkMapper() => NetworkMapper(log: log);
}
