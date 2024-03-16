import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor.freezed.dart';

@freezed
class Floor with _$Floor{
  const factory Floor({
    required int id,
    required String name,
    required int buildingId,
  }) = _Floor;
}