import 'dart:convert';

class RoomTimeslotResponse {
  final int? code;
  final String? status;
  final RoomDataResponse? data;

  RoomTimeslotResponse({
    this.code,
    this.status,
    this.data,
  });

  factory RoomTimeslotResponse.fromRawJson(String str) => RoomTimeslotResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomTimeslotResponse.fromJson(Map<String, dynamic> json) => RoomTimeslotResponse(
    code: json["code"],
    status: json["status"],
    data: json["data"] == null ? null : RoomDataResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data?.toJson(),
  };
}

class RoomDataResponse {
  final int? id;
  final String? name;
  final int? capacity;
  final int? building;
  final int? floor;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<TimeSlot>? timeSlot;

  RoomDataResponse({
    this.id,
    this.name,
    this.capacity,
    this.building,
    this.floor,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.timeSlot,
  });

  factory RoomDataResponse.fromRawJson(String str) => RoomDataResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomDataResponse.fromJson(Map<String, dynamic> json) => RoomDataResponse(
    id: json["id"],
    name: json["name"],
    capacity: json["capacity"],
    building: json["building"],
    floor: json["floor"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    timeSlot: json["time_slot"] == null ? [] : List<TimeSlot>.from(json["time_slot"]!.map((x) => TimeSlot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "capacity": capacity,
    "building": building,
    "floor": floor,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "time_slot": timeSlot == null ? [] : List<dynamic>.from(timeSlot!.map((x) => x.toJson())),
  };
}

class TimeSlot {
  final int? timeSlotId;
  final String? startTime;
  final String? endTime;

  TimeSlot({
    this.timeSlotId,
    this.startTime,
    this.endTime,
  });

  factory TimeSlot.fromRawJson(String str) => TimeSlot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    timeSlotId: json["time_slot_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
  );

  Map<String, dynamic> toJson() => {
    "time_slot_id": timeSlotId,
    "start_time": startTime,
    "end_time": endTime,
  };
}
