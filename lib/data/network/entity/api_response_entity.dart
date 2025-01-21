import 'package:json_annotation/json_annotation.dart';

part 'api_response_entity.g.dart';

@JsonSerializable()
class ApiResponseEntity {
  @JsonKey(name: "code")
  final int? code;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "data")
  final List<dynamic>? data;

  ApiResponseEntity({
    this.code,
    this.status,
    this.data,
  });

  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => _$ApiResponseEntityFromJson(json);
}


// https://medium.com/@r_dev/json-serialization-in-flutter-using-generics-e5f27580cbb4