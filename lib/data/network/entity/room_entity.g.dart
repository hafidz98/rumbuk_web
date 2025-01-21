// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEntity _$RoomEntityFromJson(Map<String, dynamic> json) => RoomEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      capacity: json['capacity'] as int,
      buildingId: json['building_id'] as int?,
      floorId: json['floor_id'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RoomEntityToJson(RoomEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capacity': instance.capacity,
      'building_id': instance.buildingId,
      'floor_id': instance.floorId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
