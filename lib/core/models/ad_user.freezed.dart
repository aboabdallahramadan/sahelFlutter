// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdUser _$AdUserFromJson(Map<String, dynamic> json) {
  return _AdUser.fromJson(json);
}

/// @nodoc
mixin _$AdUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String get memberSince => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this AdUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdUserCopyWith<AdUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdUserCopyWith<$Res> {
  factory $AdUserCopyWith(AdUser value, $Res Function(AdUser) then) =
      _$AdUserCopyWithImpl<$Res, AdUser>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? avatar,
      String memberSince,
      String? phoneNumber});
}

/// @nodoc
class _$AdUserCopyWithImpl<$Res, $Val extends AdUser>
    implements $AdUserCopyWith<$Res> {
  _$AdUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
    Object? memberSince = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      memberSince: null == memberSince
          ? _value.memberSince
          : memberSince // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdUserImplCopyWith<$Res> implements $AdUserCopyWith<$Res> {
  factory _$$AdUserImplCopyWith(
          _$AdUserImpl value, $Res Function(_$AdUserImpl) then) =
      __$$AdUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? avatar,
      String memberSince,
      String? phoneNumber});
}

/// @nodoc
class __$$AdUserImplCopyWithImpl<$Res>
    extends _$AdUserCopyWithImpl<$Res, _$AdUserImpl>
    implements _$$AdUserImplCopyWith<$Res> {
  __$$AdUserImplCopyWithImpl(
      _$AdUserImpl _value, $Res Function(_$AdUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
    Object? memberSince = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$AdUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      memberSince: null == memberSince
          ? _value.memberSince
          : memberSince // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdUserImpl implements _AdUser {
  const _$AdUserImpl(
      {required this.id,
      required this.name,
      this.avatar,
      required this.memberSince,
      this.phoneNumber});

  factory _$AdUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? avatar;
  @override
  final String memberSince;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'AdUser(id: $id, name: $name, avatar: $avatar, memberSince: $memberSince, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.memberSince, memberSince) ||
                other.memberSince == memberSince) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, avatar, memberSince, phoneNumber);

  /// Create a copy of AdUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdUserImplCopyWith<_$AdUserImpl> get copyWith =>
      __$$AdUserImplCopyWithImpl<_$AdUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdUserImplToJson(
      this,
    );
  }
}

abstract class _AdUser implements AdUser {
  const factory _AdUser(
      {required final String id,
      required final String name,
      final String? avatar,
      required final String memberSince,
      final String? phoneNumber}) = _$AdUserImpl;

  factory _AdUser.fromJson(Map<String, dynamic> json) = _$AdUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get avatar;
  @override
  String get memberSince;
  @override
  String? get phoneNumber;

  /// Create a copy of AdUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdUserImplCopyWith<_$AdUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
