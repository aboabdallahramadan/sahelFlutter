// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) {
  return _VerifyOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpResponse {
  String get token => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpResponseCopyWith<$Res> {
  factory $VerifyOtpResponseCopyWith(
          VerifyOtpResponse value, $Res Function(VerifyOtpResponse) then) =
      _$VerifyOtpResponseCopyWithImpl<$Res, VerifyOtpResponse>;
  @useResult
  $Res call({String token, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$VerifyOtpResponseCopyWithImpl<$Res, $Val extends VerifyOtpResponse>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  /// Create a copy of VerifyOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyOtpResponseImplCopyWith<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$$VerifyOtpResponseImplCopyWith(_$VerifyOtpResponseImpl value,
          $Res Function(_$VerifyOtpResponseImpl) then) =
      __$$VerifyOtpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$VerifyOtpResponseImplCopyWithImpl<$Res>
    extends _$VerifyOtpResponseCopyWithImpl<$Res, _$VerifyOtpResponseImpl>
    implements _$$VerifyOtpResponseImplCopyWith<$Res> {
  __$$VerifyOtpResponseImplCopyWithImpl(_$VerifyOtpResponseImpl _value,
      $Res Function(_$VerifyOtpResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_$VerifyOtpResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpResponseImpl implements _VerifyOtpResponse {
  const _$VerifyOtpResponseImpl({required this.token, required this.user});

  factory _$VerifyOtpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpResponseImplFromJson(json);

  @override
  final String token;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'VerifyOtpResponse(token: $token, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  /// Create a copy of VerifyOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpResponseImplCopyWith<_$VerifyOtpResponseImpl> get copyWith =>
      __$$VerifyOtpResponseImplCopyWithImpl<_$VerifyOtpResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpResponse implements VerifyOtpResponse {
  const factory _VerifyOtpResponse(
      {required final String token,
      required final UserModel user}) = _$VerifyOtpResponseImpl;

  factory _VerifyOtpResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpResponseImpl.fromJson;

  @override
  String get token;
  @override
  UserModel get user;

  /// Create a copy of VerifyOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpResponseImplCopyWith<_$VerifyOtpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
