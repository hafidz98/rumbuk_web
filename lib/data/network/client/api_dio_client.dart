import 'package:dio/dio.dart';
import 'package:rumbuk_web/constants/strings.dart';

class ApiDioClient {
  // ApiDioClient._() {_dio;}
  //
  // static final instance = ApiDioClient._();
  //
  // static final Dio _dio = Dio(BaseOptions(
  //   baseUrl: baseUrl,
  // ))
  //   ..interceptors.add(LogInterceptor(
  //     requestBody: true,
  //     responseBody: true,
  //   ));
  //
  // factory ApiDioClient() {
  //   return instance;
  // }
  late final Dio dio;

  static final _instance = ApiDioClient._();

  factory ApiDioClient() => _instance;

  ApiDioClient._() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
  }
}

// https://www.dbestech.com/tutorials/flutter-dio-networking