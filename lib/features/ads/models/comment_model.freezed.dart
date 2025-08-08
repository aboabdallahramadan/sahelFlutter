// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  int get id => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get offerId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userProfilePhotoUrl => throw _privateConstructorUsedError;
  int? get replyToCommentId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get repliesCount => throw _privateConstructorUsedError;

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {int id,
      String comment,
      int offerId,
      int userId,
      String userName,
      String userProfilePhotoUrl,
      int? replyToCommentId,
      DateTime createdAt,
      int repliesCount});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = null,
    Object? offerId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userProfilePhotoUrl = null,
    Object? replyToCommentId = freezed,
    Object? createdAt = null,
    Object? repliesCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePhotoUrl: null == userProfilePhotoUrl
          ? _value.userProfilePhotoUrl
          : userProfilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      replyToCommentId: freezed == replyToCommentId
          ? _value.replyToCommentId
          : replyToCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentModelImplCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$CommentModelImplCopyWith(
          _$CommentModelImpl value, $Res Function(_$CommentModelImpl) then) =
      __$$CommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String comment,
      int offerId,
      int userId,
      String userName,
      String userProfilePhotoUrl,
      int? replyToCommentId,
      DateTime createdAt,
      int repliesCount});
}

/// @nodoc
class __$$CommentModelImplCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$CommentModelImpl>
    implements _$$CommentModelImplCopyWith<$Res> {
  __$$CommentModelImplCopyWithImpl(
      _$CommentModelImpl _value, $Res Function(_$CommentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = null,
    Object? offerId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userProfilePhotoUrl = null,
    Object? replyToCommentId = freezed,
    Object? createdAt = null,
    Object? repliesCount = null,
  }) {
    return _then(_$CommentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePhotoUrl: null == userProfilePhotoUrl
          ? _value.userProfilePhotoUrl
          : userProfilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      replyToCommentId: freezed == replyToCommentId
          ? _value.replyToCommentId
          : replyToCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentModelImpl implements _CommentModel {
  const _$CommentModelImpl(
      {required this.id,
      required this.comment,
      required this.offerId,
      required this.userId,
      required this.userName,
      required this.userProfilePhotoUrl,
      this.replyToCommentId,
      required this.createdAt,
      required this.repliesCount});

  factory _$CommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String comment;
  @override
  final int offerId;
  @override
  final int userId;
  @override
  final String userName;
  @override
  final String userProfilePhotoUrl;
  @override
  final int? replyToCommentId;
  @override
  final DateTime createdAt;
  @override
  final int repliesCount;

  @override
  String toString() {
    return 'CommentModel(id: $id, comment: $comment, offerId: $offerId, userId: $userId, userName: $userName, userProfilePhotoUrl: $userProfilePhotoUrl, replyToCommentId: $replyToCommentId, createdAt: $createdAt, repliesCount: $repliesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userProfilePhotoUrl, userProfilePhotoUrl) ||
                other.userProfilePhotoUrl == userProfilePhotoUrl) &&
            (identical(other.replyToCommentId, replyToCommentId) ||
                other.replyToCommentId == replyToCommentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, comment, offerId, userId,
      userName, userProfilePhotoUrl, replyToCommentId, createdAt, repliesCount);

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      __$$CommentModelImplCopyWithImpl<_$CommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelImplToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
      {required final int id,
      required final String comment,
      required final int offerId,
      required final int userId,
      required final String userName,
      required final String userProfilePhotoUrl,
      final int? replyToCommentId,
      required final DateTime createdAt,
      required final int repliesCount}) = _$CommentModelImpl;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$CommentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get comment;
  @override
  int get offerId;
  @override
  int get userId;
  @override
  String get userName;
  @override
  String get userProfilePhotoUrl;
  @override
  int? get replyToCommentId;
  @override
  DateTime get createdAt;
  @override
  int get repliesCount;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
