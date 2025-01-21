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
  final int? id;
  final String startTime;
  final String endTime;
  final int duration;

  TimeSlot({
    this.id,
    required this.startTime,
    required this.endTime,
    required this.duration
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['id'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      duration: json['duration'],
    );
  }

  static Map<String, dynamic> toJson(TimeSlot timeSlot) => {
    'start_time': timeSlot.startTime,
    'end_time': timeSlot.endTime,
    'duration': timeSlot.duration,
  };
}
