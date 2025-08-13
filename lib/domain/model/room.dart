import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int id,
    required String name,
    required int capacity,
    int? buildingId,
    int? floorId,
    String? status,
  }) = _Room;
}
