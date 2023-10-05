class NetworkExcepton implements Exception{
  final int statusCode;
  String? message;

  NetworkExcepton({required this.statusCode, this.message});

  @override
  String toString() => 'NetworkException: status code $statusCode, message: $message';
}