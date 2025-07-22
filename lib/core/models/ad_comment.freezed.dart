// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdComment _$AdCommentFromJson(Map<String, dynamic> json) {
  return _AdComment.fromJson(json);
}

/// @nodoc
mixin _$AdComment {
  String get id => throw _privateConstructorUsedError;
  CommentUser get user => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get timeAgo => throw _privateConstructorUsedError;

  /// Serializes this AdComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdCommentCopyWith<AdComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdCommentCopyWith<$Res> {
  factory $AdCommentCopyWith(AdComment value, $Res Function(AdComment) then) =
      _$AdCommentCopyWithImpl<$Res, AdComment>;
  @useResult
  $Res call({String id, CommentUser user, String comment, String timeAgo});

  $CommentUserCopyWith<$Res> get user;
}

/// @nodoc
class _$AdCommentCopyWithImpl<$Res, $Val extends AdComment>
    implements $AdCommentCopyWith<$Res> {
  _$AdCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? comment = null,
    Object? timeAgo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUser,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      timeAgo: null == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AdComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentUserCopyWith<$Res> get user {
    return $CommentUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdCommentImplCopyWith<$Res>
    implements $AdCommentCopyWith<$Res> {
  factory _$$AdCommentImplCopyWith(
          _$AdCommentImpl value, $Res Function(_$AdCommentImpl) then) =
      __$$AdCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, CommentUser user, String comment, String timeAgo});

  @override
  $CommentUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AdCommentImplCopyWithImpl<$Res>
    extends _$AdCommentCopyWithImpl<$Res, _$AdCommentImpl>
    implements _$$AdCommentImplCopyWith<$Res> {
  __$$AdCommentImplCopyWithImpl(
      _$AdCommentImpl _value, $Res Function(_$AdCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? comment = null,
    Object? timeAgo = null,
  }) {
    return _then(_$AdCommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUser,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      timeAgo: null == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdCommentImpl implements _AdComment {
  const _$AdCommentImpl(
      {required this.id,
      required this.user,
      required this.comment,
      required this.timeAgo});

  factory _$AdCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdCommentImplFromJson(json);

  @override
  final String id;
  @override
  final CommentUser user;
  @override
  final String comment;
  @override
  final String timeAgo;

  @override
  String toString() {
    return 'AdComment(id: $id, user: $user, comment: $comment, timeAgo: $timeAgo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, comment, timeAgo);

  /// Create a copy of AdComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdCommentImplCopyWith<_$AdCommentImpl> get copyWith =>
      __$$AdCommentImplCopyWithImpl<_$AdCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdCommentImplToJson(
      this,
    );
  }
}

abstract class _AdComment implements AdComment {
  const factory _AdComment(
      {required final String id,
      required final CommentUser user,
      required final String comment,
      required final String timeAgo}) = _$AdCommentImpl;

  factory _AdComment.fromJson(Map<String, dynamic> json) =
      _$AdCommentImpl.fromJson;

  @override
  String get id;
  @override
  CommentUser get user;
  @override
  String get comment;
  @override
  String get timeAgo;

  /// Create a copy of AdComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdCommentImplCopyWith<_$AdCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentUser _$CommentUserFromJson(Map<String, dynamic> json) {
  return _CommentUser.fromJson(json);
}

/// @nodoc
mixin _$CommentUser {
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this CommentUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentUserCopyWith<CommentUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentUserCopyWith<$Res> {
  factory $CommentUserCopyWith(
          CommentUser value, $Res Function(CommentUser) then) =
      _$CommentUserCopyWithImpl<$Res, CommentUser>;
  @useResult
  $Res call({String name, String? avatar});
}

/// @nodoc
class _$CommentUserCopyWithImpl<$Res, $Val extends CommentUser>
    implements $CommentUserCopyWith<$Res> {
  _$CommentUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentUserImplCopyWith<$Res>
    implements $CommentUserCopyWith<$Res> {
  factory _$$CommentUserImplCopyWith(
          _$CommentUserImpl value, $Res Function(_$CommentUserImpl) then) =
      __$$CommentUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? avatar});
}

/// @nodoc
class __$$CommentUserImplCopyWithImpl<$Res>
    extends _$CommentUserCopyWithImpl<$Res, _$CommentUserImpl>
    implements _$$CommentUserImplCopyWith<$Res> {
  __$$CommentUserImplCopyWithImpl(
      _$CommentUserImpl _value, $Res Function(_$CommentUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_$CommentUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentUserImpl implements _CommentUser {
  const _$CommentUserImpl({required this.name, this.avatar});

  factory _$CommentUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentUserImplFromJson(json);

  @override
  final String name;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'CommentUser(name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, avatar);

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentUserImplCopyWith<_$CommentUserImpl> get copyWith =>
      __$$CommentUserImplCopyWithImpl<_$CommentUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentUserImplToJson(
      this,
    );
  }
}

abstract class _CommentUser implements CommentUser {
  const factory _CommentUser(
      {required final String name, final String? avatar}) = _$CommentUserImpl;

  factory _CommentUser.fromJson(Map<String, dynamic> json) =
      _$CommentUserImpl.fromJson;

  @override
  String get name;
  @override
  String? get avatar;

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentUserImplCopyWith<_$CommentUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
