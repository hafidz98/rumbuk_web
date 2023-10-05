import 'package:json_annotation/json_annotation.dart';

part 'building_entity.g.dart';

@JsonSerializable()
class BuildingResponse {
  int code;
  String status;
  List<BuildingEntity> data;

  BuildingResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory BuildingResponse.fromJson(Map<String, dynamic> json) => _$BuildingResponseFromJson(json);
}

@JsonSerializable()
class BuildingEntity {
  int id;
  String name;
  @JsonKey(name: 'created_at') DateTime? createdAt;
  @JsonKey(name: 'updated_at') DateTime? updatedAt;

  BuildingEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BuildingEntity.fromJson(Map<String, dynamic> json) => _$BuildingEntityFromJson(json);
}
