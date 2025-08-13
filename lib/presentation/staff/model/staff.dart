class ApiResponse {
  final int code;
  final String status;
  final List<Staff> data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      status: json['status'],
      data: (json['data'] as List).map((item) => Staff.fromJson(item)).toList(),
    );
  }
}

class Staff {
  final String id;
  final String name;
  final String role;
  final String email;
  final String? password;

  Staff({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
    this.password,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['staff_id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
    );
  }

  static Map<String, dynamic> toJson(Staff staff) => {
        'staff_id': staff.id,
        'name': staff.name,
        'role': staff.role,
        'email': staff.email,
        'password': staff.password
      };
}
