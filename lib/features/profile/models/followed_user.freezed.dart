// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followed_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowedUser _$FollowedUserFromJson(Map<String, dynamic> json) {
  return _FollowedUser.fromJson(json);
}

/// @nodoc
mixin _$FollowedUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get profilePhotoUrl => throw _privateConstructorUsedError;

  /// Serializes this FollowedUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowedUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowedUserCopyWith<FollowedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowedUserCopyWith<$Res> {
  factory $FollowedUserCopyWith(
          FollowedUser value, $Res Function(FollowedUser) then) =
      _$FollowedUserCopyWithImpl<$Res, FollowedUser>;
  @useResult
  $Res call({int id, String name, String phoneNumber, String profilePhotoUrl});
}

/// @nodoc
class _$FollowedUserCopyWithImpl<$Res, $Val extends FollowedUser>
    implements $FollowedUserCopyWith<$Res> {
  _$FollowedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowedUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? profilePhotoUrl = null,
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: null == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowedUserImplCopyWith<$Res>
    implements $FollowedUserCopyWith<$Res> {
  factory _$$FollowedUserImplCopyWith(
          _$FollowedUserImpl value, $Res Function(_$FollowedUserImpl) then) =
      __$$FollowedUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String phoneNumber, String profilePhotoUrl});
}

/// @nodoc
class __$$FollowedUserImplCopyWithImpl<$Res>
    extends _$FollowedUserCopyWithImpl<$Res, _$FollowedUserImpl>
    implements _$$FollowedUserImplCopyWith<$Res> {
  __$$FollowedUserImplCopyWithImpl(
      _$FollowedUserImpl _value, $Res Function(_$FollowedUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowedUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? profilePhotoUrl = null,
  }) {
    return _then(_$FollowedUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: null == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowedUserImpl implements _FollowedUser {
  const _$FollowedUserImpl(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.profilePhotoUrl});

  factory _$FollowedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowedUserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String profilePhotoUrl;

  @override
  String toString() {
    return 'FollowedUser(id: $id, name: $name, phoneNumber: $phoneNumber, profilePhotoUrl: $profilePhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowedUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phoneNumber, profilePhotoUrl);

  /// Create a copy of FollowedUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowedUserImplCopyWith<_$FollowedUserImpl> get copyWith =>
      __$$FollowedUserImplCopyWithImpl<_$FollowedUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowedUserImplToJson(
      this,
    );
  }
}

abstract class _FollowedUser implements FollowedUser {
  const factory _FollowedUser(
      {required final int id,
      required final String name,
      required final String phoneNumber,
      required final String profilePhotoUrl}) = _$FollowedUserImpl;

  factory _FollowedUser.fromJson(Map<String, dynamic> json) =
      _$FollowedUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get profilePhotoUrl;

  /// Create a copy of FollowedUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowedUserImplCopyWith<_$FollowedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
