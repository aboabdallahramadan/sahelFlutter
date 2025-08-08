// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentRequest _$CommentRequestFromJson(Map<String, dynamic> json) {
  return _CommentRequest.fromJson(json);
}

/// @nodoc
mixin _$CommentRequest {
  String get comment => throw _privateConstructorUsedError;
  int? get replyToCommentId => throw _privateConstructorUsedError;

  /// Serializes this CommentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentRequestCopyWith<CommentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRequestCopyWith<$Res> {
  factory $CommentRequestCopyWith(
          CommentRequest value, $Res Function(CommentRequest) then) =
      _$CommentRequestCopyWithImpl<$Res, CommentRequest>;
  @useResult
  $Res call({String comment, int? replyToCommentId});
}

/// @nodoc
class _$CommentRequestCopyWithImpl<$Res, $Val extends CommentRequest>
    implements $CommentRequestCopyWith<$Res> {
  _$CommentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? replyToCommentId = freezed,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      replyToCommentId: freezed == replyToCommentId
          ? _value.replyToCommentId
          : replyToCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentRequestImplCopyWith<$Res>
    implements $CommentRequestCopyWith<$Res> {
  factory _$$CommentRequestImplCopyWith(_$CommentRequestImpl value,
          $Res Function(_$CommentRequestImpl) then) =
      __$$CommentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment, int? replyToCommentId});
}

/// @nodoc
class __$$CommentRequestImplCopyWithImpl<$Res>
    extends _$CommentRequestCopyWithImpl<$Res, _$CommentRequestImpl>
    implements _$$CommentRequestImplCopyWith<$Res> {
  __$$CommentRequestImplCopyWithImpl(
      _$CommentRequestImpl _value, $Res Function(_$CommentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? replyToCommentId = freezed,
  }) {
    return _then(_$CommentRequestImpl(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      replyToCommentId: freezed == replyToCommentId
          ? _value.replyToCommentId
          : replyToCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentRequestImpl implements _CommentRequest {
  const _$CommentRequestImpl({required this.comment, this.replyToCommentId});

  factory _$CommentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentRequestImplFromJson(json);

  @override
  final String comment;
  @override
  final int? replyToCommentId;

  @override
  String toString() {
    return 'CommentRequest(comment: $comment, replyToCommentId: $replyToCommentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentRequestImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.replyToCommentId, replyToCommentId) ||
                other.replyToCommentId == replyToCommentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, comment, replyToCommentId);

  /// Create a copy of CommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentRequestImplCopyWith<_$CommentRequestImpl> get copyWith =>
      __$$CommentRequestImplCopyWithImpl<_$CommentRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentRequestImplToJson(
      this,
    );
  }
}

abstract class _CommentRequest implements CommentRequest {
  const factory _CommentRequest(
      {required final String comment,
      final int? replyToCommentId}) = _$CommentRequestImpl;

  factory _CommentRequest.fromJson(Map<String, dynamic> json) =
      _$CommentRequestImpl.fromJson;

  @override
  String get comment;
  @override
  int? get replyToCommentId;

  /// Create a copy of CommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentRequestImplCopyWith<_$CommentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
