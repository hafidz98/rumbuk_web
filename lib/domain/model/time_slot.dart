import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';

@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required int id,
    required DateTime startTime,
    required DateTime endTime,
    required int duration,
  }) = _TimeSlot;
}
