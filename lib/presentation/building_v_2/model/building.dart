import 'dart:convert';

class ApiResponse {
  final int code;
  final String status;
  final List<Building> data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      status: json['status'],
      data: (json['data'] as List).map((item) => Building.fromJson(item)).toList(),
    );
  }
}

class Building {
  final int? id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Building({
    this.id,
    required this.name,
    this.createdAt,
    this.updatedAt
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Building timeSlot) => {
    'name': timeSlot.name,
    'created_at': timeSlot.createdAt,
    'updated_at': timeSlot.updatedAt,
  };
}


