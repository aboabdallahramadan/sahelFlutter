// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_creation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatCreationResponse _$ChatCreationResponseFromJson(Map<String, dynamic> json) {
  return _ChatCreationResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatCreationResponse {
  int get id => throw _privateConstructorUsedError;
  ChatUser get user => throw _privateConstructorUsedError;

  /// Serializes this ChatCreationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatCreationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatCreationResponseCopyWith<ChatCreationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCreationResponseCopyWith<$Res> {
  factory $ChatCreationResponseCopyWith(ChatCreationResponse value,
          $Res Function(ChatCreationResponse) then) =
      _$ChatCreationResponseCopyWithImpl<$Res, ChatCreationResponse>;
  @useResult
  $Res call({int id, ChatUser user});

  $ChatUserCopyWith<$Res> get user;
}

/// @nodoc
class _$ChatCreationResponseCopyWithImpl<$Res,
        $Val extends ChatCreationResponse>
    implements $ChatCreationResponseCopyWith<$Res> {
  _$ChatCreationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatCreationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ChatUser,
    ) as $Val);
  }

  /// Create a copy of ChatCreationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatUserCopyWith<$Res> get user {
    return $ChatUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatCreationResponseImplCopyWith<$Res>
    implements $ChatCreationResponseCopyWith<$Res> {
  factory _$$ChatCreationResponseImplCopyWith(_$ChatCreationResponseImpl value,
          $Res Function(_$ChatCreationResponseImpl) then) =
      __$$ChatCreationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ChatUser user});

  @override
  $ChatUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ChatCreationResponseImplCopyWithImpl<$Res>
    extends _$ChatCreationResponseCopyWithImpl<$Res, _$ChatCreationResponseImpl>
    implements _$$ChatCreationResponseImplCopyWith<$Res> {
  __$$ChatCreationResponseImplCopyWithImpl(_$ChatCreationResponseImpl _value,
      $Res Function(_$ChatCreationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatCreationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
  }) {
    return _then(_$ChatCreationResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ChatUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCreationResponseImpl implements _ChatCreationResponse {
  const _$ChatCreationResponseImpl({required this.id, required this.user});

  factory _$ChatCreationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCreationResponseImplFromJson(json);

  @override
  final int id;
  @override
  final ChatUser user;

  @override
  String toString() {
    return 'ChatCreationResponse(id: $id, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCreationResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user);

  /// Create a copy of ChatCreationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCreationResponseImplCopyWith<_$ChatCreationResponseImpl>
      get copyWith =>
          __$$ChatCreationResponseImplCopyWithImpl<_$ChatCreationResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCreationResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatCreationResponse implements ChatCreationResponse {
  const factory _ChatCreationResponse(
      {required final int id,
      required final ChatUser user}) = _$ChatCreationResponseImpl;

  factory _ChatCreationResponse.fromJson(Map<String, dynamic> json) =
      _$ChatCreationResponseImpl.fromJson;

  @override
  int get id;
  @override
  ChatUser get user;

  /// Create a copy of ChatCreationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatCreationResponseImplCopyWith<_$ChatCreationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) {
  return _ChatUser.fromJson(json);
}

/// @nodoc
mixin _$ChatUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get profilePhotoUrl => throw _privateConstructorUsedError;

  /// Serializes this ChatUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatUserCopyWith<ChatUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserCopyWith<$Res> {
  factory $ChatUserCopyWith(ChatUser value, $Res Function(ChatUser) then) =
      _$ChatUserCopyWithImpl<$Res, ChatUser>;
  @useResult
  $Res call({int id, String name, String phoneNumber, String profilePhotoUrl});
}

/// @nodoc
class _$ChatUserCopyWithImpl<$Res, $Val extends ChatUser>
    implements $ChatUserCopyWith<$Res> {
  _$ChatUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatUser
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
abstract class _$$ChatUserImplCopyWith<$Res>
    implements $ChatUserCopyWith<$Res> {
  factory _$$ChatUserImplCopyWith(
          _$ChatUserImpl value, $Res Function(_$ChatUserImpl) then) =
      __$$ChatUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String phoneNumber, String profilePhotoUrl});
}

/// @nodoc
class __$$ChatUserImplCopyWithImpl<$Res>
    extends _$ChatUserCopyWithImpl<$Res, _$ChatUserImpl>
    implements _$$ChatUserImplCopyWith<$Res> {
  __$$ChatUserImplCopyWithImpl(
      _$ChatUserImpl _value, $Res Function(_$ChatUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? profilePhotoUrl = null,
  }) {
    return _then(_$ChatUserImpl(
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
class _$ChatUserImpl implements _ChatUser {
  const _$ChatUserImpl(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.profilePhotoUrl});

  factory _$ChatUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatUserImplFromJson(json);

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
    return 'ChatUser(id: $id, name: $name, phoneNumber: $phoneNumber, profilePhotoUrl: $profilePhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUserImpl &&
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

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatUserImplCopyWith<_$ChatUserImpl> get copyWith =>
      __$$ChatUserImplCopyWithImpl<_$ChatUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatUserImplToJson(
      this,
    );
  }
}

abstract class _ChatUser implements ChatUser {
  const factory _ChatUser(
      {required final int id,
      required final String name,
      required final String phoneNumber,
      required final String profilePhotoUrl}) = _$ChatUserImpl;

  factory _ChatUser.fromJson(Map<String, dynamic> json) =
      _$ChatUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get profilePhotoUrl;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatUserImplCopyWith<_$ChatUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
