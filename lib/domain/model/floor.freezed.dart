// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Floor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get buildingId => throw _privateConstructorUsedError;

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloorCopyWith<Floor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorCopyWith<$Res> {
  factory $FloorCopyWith(Floor value, $Res Function(Floor) then) =
      _$FloorCopyWithImpl<$Res, Floor>;
  @useResult
  $Res call({int id, String name, int buildingId});
}

/// @nodoc
class _$FloorCopyWithImpl<$Res, $Val extends Floor>
    implements $FloorCopyWith<$Res> {
  _$FloorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? buildingId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorImplCopyWith<$Res> implements $FloorCopyWith<$Res> {
  factory _$$FloorImplCopyWith(
          _$FloorImpl value, $Res Function(_$FloorImpl) then) =
      __$$FloorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int buildingId});
}

/// @nodoc
class __$$FloorImplCopyWithImpl<$Res>
    extends _$FloorCopyWithImpl<$Res, _$FloorImpl>
    implements _$$FloorImplCopyWith<$Res> {
  __$$FloorImplCopyWithImpl(
      _$FloorImpl _value, $Res Function(_$FloorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? buildingId = null,
  }) {
    return _then(_$FloorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: null == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FloorImpl implements _Floor {
  const _$FloorImpl(
      {required this.id, required this.name, required this.buildingId});

  @override
  final int id;
  @override
  final String name;
  @override
  final int buildingId;

  @override
  String toString() {
    return 'Floor(id: $id, name: $name, buildingId: $buildingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, buildingId);

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorImplCopyWith<_$FloorImpl> get copyWith =>
      __$$FloorImplCopyWithImpl<_$FloorImpl>(this, _$identity);
}

abstract class _Floor implements Floor {
  const factory _Floor(
      {required final int id,
      required final String name,
      required final int buildingId}) = _$FloorImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  int get buildingId;

  /// Create a copy of Floor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloorImplCopyWith<_$FloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
