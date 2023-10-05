// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingResponse _$BuildingResponseFromJson(Map<String, dynamic> json) =>
    BuildingResponse(
      code: json['code'] as int,
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => BuildingEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildingResponseToJson(BuildingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

BuildingEntity _$BuildingEntityFromJson(Map<String, dynamic> json) =>
    BuildingEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BuildingEntityToJson(BuildingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
