import 'package:dio/dio.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';

import '../entity/building_entity.dart';

class ApiService {
  String baseUrl;
  String apiKey;
  String apiHost;
  late final Dio dio = Dio();

  ApiService({required this.baseUrl, required this.apiKey, required this.apiHost,}){
    dio.options.baseUrl = baseUrl;
  }

  // ApiService({
  //   required this.baseUrl,
  //   required this.apiKey,
  //   required this.apiHost,
  // }){
  //   Dio(
  //       BaseOptions(
  //           baseUrl: baseUrl
  //       )
  //   );
  // }

  // dio = Dio()
  // ..options.baseUrl = baseUrl
  // ..options.headers = {
  // //'x-rumbuk-key': apiKey,
  // }
  // ..interceptors.add(
  // LogInterceptor(
  // requestBody: true,
  // responseBody: true,
  // ),
  // );
}
