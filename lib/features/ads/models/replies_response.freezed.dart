// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepliesResponse _$RepliesResponseFromJson(Map<String, dynamic> json) {
  return _RepliesResponse.fromJson(json);
}

/// @nodoc
mixin _$RepliesResponse {
  List<CommentModel> get items => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int? get nextCursor => throw _privateConstructorUsedError;

  /// Serializes this RepliesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepliesResponseCopyWith<RepliesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliesResponseCopyWith<$Res> {
  factory $RepliesResponseCopyWith(
          RepliesResponse value, $Res Function(RepliesResponse) then) =
      _$RepliesResponseCopyWithImpl<$Res, RepliesResponse>;
  @useResult
  $Res call({List<CommentModel> items, bool hasMore, int? nextCursor});
}

/// @nodoc
class _$RepliesResponseCopyWithImpl<$Res, $Val extends RepliesResponse>
    implements $RepliesResponseCopyWith<$Res> {
  _$RepliesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepliesResponseImplCopyWith<$Res>
    implements $RepliesResponseCopyWith<$Res> {
  factory _$$RepliesResponseImplCopyWith(_$RepliesResponseImpl value,
          $Res Function(_$RepliesResponseImpl) then) =
      __$$RepliesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentModel> items, bool hasMore, int? nextCursor});
}

/// @nodoc
class __$$RepliesResponseImplCopyWithImpl<$Res>
    extends _$RepliesResponseCopyWithImpl<$Res, _$RepliesResponseImpl>
    implements _$$RepliesResponseImplCopyWith<$Res> {
  __$$RepliesResponseImplCopyWithImpl(
      _$RepliesResponseImpl _value, $Res Function(_$RepliesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_$RepliesResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepliesResponseImpl implements _RepliesResponse {
  const _$RepliesResponseImpl(
      {required final List<CommentModel> items,
      required this.hasMore,
      this.nextCursor})
      : _items = items;

  factory _$RepliesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepliesResponseImplFromJson(json);

  final List<CommentModel> _items;
  @override
  List<CommentModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool hasMore;
  @override
  final int? nextCursor;

  @override
  String toString() {
    return 'RepliesResponse(items: $items, hasMore: $hasMore, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepliesResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), hasMore, nextCursor);

  /// Create a copy of RepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepliesResponseImplCopyWith<_$RepliesResponseImpl> get copyWith =>
      __$$RepliesResponseImplCopyWithImpl<_$RepliesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepliesResponseImplToJson(
      this,
    );
  }
}

abstract class _RepliesResponse implements RepliesResponse {
  const factory _RepliesResponse(
      {required final List<CommentModel> items,
      required final bool hasMore,
      final int? nextCursor}) = _$RepliesResponseImpl;

  factory _RepliesResponse.fromJson(Map<String, dynamic> json) =
      _$RepliesResponseImpl.fromJson;

  @override
  List<CommentModel> get items;
  @override
  bool get hasMore;
  @override
  int? get nextCursor;

  /// Create a copy of RepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepliesResponseImplCopyWith<_$RepliesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
