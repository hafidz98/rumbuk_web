import 'package:json_annotation/json_annotation.dart';
import 'package:rumbuk_web/domain/model/room.dart';

part 'room_entity.g.dart';

@JsonSerializable()
class RoomEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "capacity")
  int? capacity;
  @JsonKey(name: "building_id")
  int? buildingId;
  @JsonKey(name: "floor_id")
  int? floorId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  RoomEntity({
    this.id,
    this.name,
    this.capacity,
    this.buildingId,
    this.floorId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson(Room room) => _$RoomEntityToJson(this);
}
