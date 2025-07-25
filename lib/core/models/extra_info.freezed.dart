// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extra_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExtraInfo _$ExtraInfoFromJson(Map<String, dynamic> json) {
  return _ExtraInfo.fromJson(json);
}

/// @nodoc
mixin _$ExtraInfo {
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this ExtraInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtraInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtraInfoCopyWith<ExtraInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraInfoCopyWith<$Res> {
  factory $ExtraInfoCopyWith(ExtraInfo value, $Res Function(ExtraInfo) then) =
      _$ExtraInfoCopyWithImpl<$Res, ExtraInfo>;
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class _$ExtraInfoCopyWithImpl<$Res, $Val extends ExtraInfo>
    implements $ExtraInfoCopyWith<$Res> {
  _$ExtraInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtraInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtraInfoImplCopyWith<$Res>
    implements $ExtraInfoCopyWith<$Res> {
  factory _$$ExtraInfoImplCopyWith(
          _$ExtraInfoImpl value, $Res Function(_$ExtraInfoImpl) then) =
      __$$ExtraInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class __$$ExtraInfoImplCopyWithImpl<$Res>
    extends _$ExtraInfoCopyWithImpl<$Res, _$ExtraInfoImpl>
    implements _$$ExtraInfoImplCopyWith<$Res> {
  __$$ExtraInfoImplCopyWithImpl(
      _$ExtraInfoImpl _value, $Res Function(_$ExtraInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtraInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$ExtraInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtraInfoImpl implements _ExtraInfo {
  const _$ExtraInfoImpl({required this.name, required this.value});

  factory _$ExtraInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtraInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String value;

  @override
  String toString() {
    return 'ExtraInfo(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  /// Create a copy of ExtraInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraInfoImplCopyWith<_$ExtraInfoImpl> get copyWith =>
      __$$ExtraInfoImplCopyWithImpl<_$ExtraInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtraInfoImplToJson(
      this,
    );
  }
}

abstract class _ExtraInfo implements ExtraInfo {
  const factory _ExtraInfo(
      {required final String name,
      required final String value}) = _$ExtraInfoImpl;

  factory _ExtraInfo.fromJson(Map<String, dynamic> json) =
      _$ExtraInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get value;

  /// Create a copy of ExtraInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtraInfoImplCopyWith<_$ExtraInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
