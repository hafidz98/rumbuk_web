// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimeSlot {
  int get id => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call({int id, DateTime startTime, DateTime endTime, int duration});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeSlotCopyWith<$Res> implements $TimeSlotCopyWith<$Res> {
  factory _$$_TimeSlotCopyWith(
          _$_TimeSlot value, $Res Function(_$_TimeSlot) then) =
      __$$_TimeSlotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime startTime, DateTime endTime, int duration});
}

/// @nodoc
class __$$_TimeSlotCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$_TimeSlot>
    implements _$$_TimeSlotCopyWith<$Res> {
  __$$_TimeSlotCopyWithImpl(
      _$_TimeSlot _value, $Res Function(_$_TimeSlot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
  }) {
    return _then(_$_TimeSlot(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TimeSlot implements _TimeSlot {
  const _$_TimeSlot(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.duration});

  @override
  final int id;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int duration;

  @override
  String toString() {
    return 'TimeSlot(id: $id, startTime: $startTime, endTime: $endTime, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeSlot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startTime, endTime, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeSlotCopyWith<_$_TimeSlot> get copyWith =>
      __$$_TimeSlotCopyWithImpl<_$_TimeSlot>(this, _$identity);
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot(
      {required final int id,
      required final DateTime startTime,
      required final DateTime endTime,
      required final int duration}) = _$_TimeSlot;

  @override
  int get id;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get duration;
  @override
  @JsonKey(ignore: true)
  _$$_TimeSlotCopyWith<_$_TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}
