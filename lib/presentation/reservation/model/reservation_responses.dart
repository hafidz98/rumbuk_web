import 'dart:convert';

class ReservationResponses {
  final int? code;
  final String? status;
  final List<ReservationModel>? data;

  ReservationResponses({
    this.code,
    this.status,
    this.data,
  });

  factory ReservationResponses.fromRawJson(String str) => ReservationResponses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationResponses.fromJson(Map<String, dynamic> json) => ReservationResponses(
    code: json["code"],
    status: json["status"],
    data: json["data"] == null ? [] : List<ReservationModel>.from(json["data"]!.map((x) => ReservationModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ReservationModel {
  final int? reservationId;
  final DateTime? bookingDate;
  final String? studentId;
  final String? activity;
  final String? status;
  final String? studentName;
  final String? startTime;
  final String? endTime;
  final String? room;
  final String? floor;
  final String? building;

  ReservationModel({
    this.reservationId,
    this.bookingDate,
    this.studentId,
    this.activity,
    this.status,
    this.studentName,
    this.startTime,
    this.endTime,
    this.room,
    this.floor,
    this.building,
  });

  factory ReservationModel.fromRawJson(String str) => ReservationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
    reservationId: json["reservation_id"],
    bookingDate: json["booking_date"] == null ? null : DateTime.parse(json["booking_date"]),
    studentId: json["student_id"],
    activity: json["activity"],
    status: json["status"],
    studentName: json["student_name"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    room: json["room"],
    floor: json["floor"],
    building: json["building"],
  );

  Map<String, dynamic> toJson() => {
    "reservation_id": reservationId,
    "booking_date": bookingDate?.toIso8601String(),
    "student_id": studentId,
    "activity": activity,
    "status": status,
    "student_name": studentName,
    "start_time": startTime,
    "end_time": endTime,
    "room": room,
    "floor": floor,
    "building": building,
  };
}
