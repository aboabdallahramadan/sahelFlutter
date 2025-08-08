// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsState {
  List<CommentModel> get comments => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int? get nextCursor => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get replyingToCommentId => throw _privateConstructorUsedError;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {List<CommentModel> comments,
      bool isLoading,
      bool hasMore,
      int? nextCursor,
      String? error,
      int? replyingToCommentId});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
    Object? error = freezed,
    Object? replyingToCommentId = freezed,
  }) {
    return _then(_value.copyWith(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      replyingToCommentId: freezed == replyingToCommentId
          ? _value.replyingToCommentId
          : replyingToCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsStateImplCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$CommentsStateImplCopyWith(
          _$CommentsStateImpl value, $Res Function(_$CommentsStateImpl) then) =
      __$$CommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommentModel> comments,
      bool isLoading,
      bool hasMore,
      int? nextCursor,
      String? error,
      int? replyingToCommentId});
}

/// @nodoc
class __$$CommentsStateImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$CommentsStateImpl>
    implements _$$CommentsStateImplCopyWith<$Res> {
  __$$CommentsStateImplCopyWithImpl(
      _$CommentsStateImpl _value, $Res Function(_$CommentsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
    Object? error = freezed,
    Object? replyingToCommentId = freezed,
  }) {
    return _then(_$CommentsStateImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      replyingToCommentId: freezed == replyingToCommentId
          ? _value.replyingToCommentId
          : replyingToCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CommentsStateImpl implements _CommentsState {
  const _$CommentsStateImpl(
      {final List<CommentModel> comments = const [],
      this.isLoading = false,
      this.hasMore = false,
      this.nextCursor,
      this.error,
      this.replyingToCommentId})
      : _comments = comments;

  final List<CommentModel> _comments;
  @override
  @JsonKey()
  List<CommentModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final int? nextCursor;
  @override
  final String? error;
  @override
  final int? replyingToCommentId;

  @override
  String toString() {
    return 'CommentsState(comments: $comments, isLoading: $isLoading, hasMore: $hasMore, nextCursor: $nextCursor, error: $error, replyingToCommentId: $replyingToCommentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsStateImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.replyingToCommentId, replyingToCommentId) ||
                other.replyingToCommentId == replyingToCommentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_comments),
      isLoading,
      hasMore,
      nextCursor,
      error,
      replyingToCommentId);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      __$$CommentsStateImplCopyWithImpl<_$CommentsStateImpl>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {final List<CommentModel> comments,
      final bool isLoading,
      final bool hasMore,
      final int? nextCursor,
      final String? error,
      final int? replyingToCommentId}) = _$CommentsStateImpl;

  @override
  List<CommentModel> get comments;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  int? get nextCursor;
  @override
  String? get error;
  @override
  int? get replyingToCommentId;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
