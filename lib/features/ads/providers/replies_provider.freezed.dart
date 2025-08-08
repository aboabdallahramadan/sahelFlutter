// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepliesState {
  List<CommentModel> get replies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int? get nextCursor => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RepliesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepliesStateCopyWith<RepliesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliesStateCopyWith<$Res> {
  factory $RepliesStateCopyWith(
          RepliesState value, $Res Function(RepliesState) then) =
      _$RepliesStateCopyWithImpl<$Res, RepliesState>;
  @useResult
  $Res call(
      {List<CommentModel> replies,
      bool isLoading,
      bool hasMore,
      int? nextCursor,
      String? error});
}

/// @nodoc
class _$RepliesStateCopyWithImpl<$Res, $Val extends RepliesState>
    implements $RepliesStateCopyWith<$Res> {
  _$RepliesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepliesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replies = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepliesStateImplCopyWith<$Res>
    implements $RepliesStateCopyWith<$Res> {
  factory _$$RepliesStateImplCopyWith(
          _$RepliesStateImpl value, $Res Function(_$RepliesStateImpl) then) =
      __$$RepliesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommentModel> replies,
      bool isLoading,
      bool hasMore,
      int? nextCursor,
      String? error});
}

/// @nodoc
class __$$RepliesStateImplCopyWithImpl<$Res>
    extends _$RepliesStateCopyWithImpl<$Res, _$RepliesStateImpl>
    implements _$$RepliesStateImplCopyWith<$Res> {
  __$$RepliesStateImplCopyWithImpl(
      _$RepliesStateImpl _value, $Res Function(_$RepliesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepliesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replies = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
    Object? error = freezed,
  }) {
    return _then(_$RepliesStateImpl(
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$RepliesStateImpl implements _RepliesState {
  const _$RepliesStateImpl(
      {final List<CommentModel> replies = const [],
      this.isLoading = false,
      this.hasMore = false,
      this.nextCursor,
      this.error})
      : _replies = replies;

  final List<CommentModel> _replies;
  @override
  @JsonKey()
  List<CommentModel> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
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
  String toString() {
    return 'RepliesState(replies: $replies, isLoading: $isLoading, hasMore: $hasMore, nextCursor: $nextCursor, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepliesStateImpl &&
            const DeepCollectionEquality().equals(other._replies, _replies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_replies),
      isLoading,
      hasMore,
      nextCursor,
      error);

  /// Create a copy of RepliesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepliesStateImplCopyWith<_$RepliesStateImpl> get copyWith =>
      __$$RepliesStateImplCopyWithImpl<_$RepliesStateImpl>(this, _$identity);
}

abstract class _RepliesState implements RepliesState {
  const factory _RepliesState(
      {final List<CommentModel> replies,
      final bool isLoading,
      final bool hasMore,
      final int? nextCursor,
      final String? error}) = _$RepliesStateImpl;

  @override
  List<CommentModel> get replies;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  int? get nextCursor;
  @override
  String? get error;

  /// Create a copy of RepliesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepliesStateImplCopyWith<_$RepliesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
