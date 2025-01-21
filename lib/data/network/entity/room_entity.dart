import 'package:json_annotation/json_annotation.dart';

part 'room_entity.g.dart';

@JsonSerializable()
class RoomEntity {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "capacity")
  int capacity;
  @JsonKey(name: "building_id")
  int? buildingId;
  @JsonKey(name: "floor_id")
  int? floorId;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  RoomEntity({
    required this.id,
    required this.name,
    required this.capacity,
    this.buildingId,
    this.floorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);
}
