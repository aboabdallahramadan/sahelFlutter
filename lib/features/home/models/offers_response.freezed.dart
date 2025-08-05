// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OffersResponse _$OffersResponseFromJson(Map<String, dynamic> json) {
  return _OffersResponse.fromJson(json);
}

/// @nodoc
mixin _$OffersResponse {
  List<OfferModel> get items => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int? get nextCursor => throw _privateConstructorUsedError;

  /// Serializes this OffersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OffersResponseCopyWith<OffersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersResponseCopyWith<$Res> {
  factory $OffersResponseCopyWith(
          OffersResponse value, $Res Function(OffersResponse) then) =
      _$OffersResponseCopyWithImpl<$Res, OffersResponse>;
  @useResult
  $Res call({List<OfferModel> items, bool hasMore, int? nextCursor});
}

/// @nodoc
class _$OffersResponseCopyWithImpl<$Res, $Val extends OffersResponse>
    implements $OffersResponseCopyWith<$Res> {
  _$OffersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OffersResponse
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
              as List<OfferModel>,
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
abstract class _$$OffersResponseImplCopyWith<$Res>
    implements $OffersResponseCopyWith<$Res> {
  factory _$$OffersResponseImplCopyWith(_$OffersResponseImpl value,
          $Res Function(_$OffersResponseImpl) then) =
      __$$OffersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OfferModel> items, bool hasMore, int? nextCursor});
}

/// @nodoc
class __$$OffersResponseImplCopyWithImpl<$Res>
    extends _$OffersResponseCopyWithImpl<$Res, _$OffersResponseImpl>
    implements _$$OffersResponseImplCopyWith<$Res> {
  __$$OffersResponseImplCopyWithImpl(
      _$OffersResponseImpl _value, $Res Function(_$OffersResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_$OffersResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
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
class _$OffersResponseImpl implements _OffersResponse {
  const _$OffersResponseImpl(
      {required final List<OfferModel> items,
      required this.hasMore,
      this.nextCursor})
      : _items = items;

  factory _$OffersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OffersResponseImplFromJson(json);

  final List<OfferModel> _items;
  @override
  List<OfferModel> get items {
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
    return 'OffersResponse(items: $items, hasMore: $hasMore, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), hasMore, nextCursor);

  /// Create a copy of OffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersResponseImplCopyWith<_$OffersResponseImpl> get copyWith =>
      __$$OffersResponseImplCopyWithImpl<_$OffersResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OffersResponseImplToJson(
      this,
    );
  }
}

abstract class _OffersResponse implements OffersResponse {
  const factory _OffersResponse(
      {required final List<OfferModel> items,
      required final bool hasMore,
      final int? nextCursor}) = _$OffersResponseImpl;

  factory _OffersResponse.fromJson(Map<String, dynamic> json) =
      _$OffersResponseImpl.fromJson;

  @override
  List<OfferModel> get items;
  @override
  bool get hasMore;
  @override
  int? get nextCursor;

  /// Create a copy of OffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OffersResponseImplCopyWith<_$OffersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
