
class ApiResponse {
  final int code;
  final String status;
  final List<Floor> data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      status: json['status'],
      data: (json['data'] as List).map((item) => Floor.fromJson(item)).toList(),
    );
  }
}

class Floor {
  final int? id;
  final int? buildingId;
  final String name;
  final String? buildingName;

  Floor({
    this.id,
    this.buildingId,
    required this.name,
    this.buildingName
  });

  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      id: json['id'],
      name: json['name'],
      buildingName: json['building_name'],
    );
  }

  static Map<String, dynamic> toJson(Floor timeSlot) => {
    'name': timeSlot.name,
    'building_id': timeSlot.buildingId,
  };
}


