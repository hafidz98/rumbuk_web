import "package:freezed_annotation/freezed_annotation.dart";

part "building.freezed.dart";

@freezed
class Building with _$Building {
  const factory Building({
    required String id,
    required String name,
  }) = _Building;
}
