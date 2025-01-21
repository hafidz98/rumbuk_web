import 'dart:convert';

class ApiResponse {
  final int code;
  final String status;
  final List<TimeSlot> data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      status: json['status'],
      data: (json['data'] as List).map((item) => TimeSlot.fromJson(item)).toList(),
    );
  }
}

class TimeSlot {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  TimeSlot({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
