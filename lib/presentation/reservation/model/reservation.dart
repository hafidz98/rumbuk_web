
class ApiResponse {
  final int code;
  final String status;
  final List<Reservation> data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      status: json['status'],
      data: (json['data'] as List).map((item) => Reservation.fromJson(item)).toList(),
    );
  }
}

class Reservation {
  final int? id;
  final int? buildingId;
  final String name;
  final String? buildingName;

  Reservation({
    this.id,
    this.buildingId,
    required this.name,
    this.buildingName
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      name: json['name'],
      buildingId: json['building_id'],
      buildingName: json['building_name'],
    );
  }

  static Map<String, dynamic> toJson(Reservation timeSlot) => {
    'name': timeSlot.name,
    'building_id': timeSlot.buildingId,
  };
}


