// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseEntity _$ApiResponseEntityFromJson(Map<String, dynamic> json) =>
    ApiResponseEntity(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ApiResponseEntityToJson(ApiResponseEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
