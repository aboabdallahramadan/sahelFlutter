// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_offers_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchOffersState {
  List<OfferModel> get offers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String get searchTerm => throw _privateConstructorUsedError;
  int? get nextCursor => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of SearchOffersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchOffersStateCopyWith<SearchOffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchOffersStateCopyWith<$Res> {
  factory $SearchOffersStateCopyWith(
          SearchOffersState value, $Res Function(SearchOffersState) then) =
      _$SearchOffersStateCopyWithImpl<$Res, SearchOffersState>;
  @useResult
  $Res call(
      {List<OfferModel> offers,
      bool isLoading,
      bool hasMore,
      String searchTerm,
      int? nextCursor,
      String? error});
}

/// @nodoc
class _$SearchOffersStateCopyWithImpl<$Res, $Val extends SearchOffersState>
    implements $SearchOffersStateCopyWith<$Res> {
  _$SearchOffersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchOffersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? searchTerm = null,
    Object? nextCursor = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      offers: null == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$SearchOffersStateImplCopyWith<$Res>
    implements $SearchOffersStateCopyWith<$Res> {
  factory _$$SearchOffersStateImplCopyWith(_$SearchOffersStateImpl value,
          $Res Function(_$SearchOffersStateImpl) then) =
      __$$SearchOffersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OfferModel> offers,
      bool isLoading,
      bool hasMore,
      String searchTerm,
      int? nextCursor,
      String? error});
}

/// @nodoc
class __$$SearchOffersStateImplCopyWithImpl<$Res>
    extends _$SearchOffersStateCopyWithImpl<$Res, _$SearchOffersStateImpl>
    implements _$$SearchOffersStateImplCopyWith<$Res> {
  __$$SearchOffersStateImplCopyWithImpl(_$SearchOffersStateImpl _value,
      $Res Function(_$SearchOffersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchOffersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? searchTerm = null,
    Object? nextCursor = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SearchOffersStateImpl(
      offers: null == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$SearchOffersStateImpl implements _SearchOffersState {
  const _$SearchOffersStateImpl(
      {final List<OfferModel> offers = const [],
      this.isLoading = false,
      this.hasMore = false,
      this.searchTerm = '',
      this.nextCursor,
      this.error})
      : _offers = offers;

  final List<OfferModel> _offers;
  @override
  @JsonKey()
  List<OfferModel> get offers {
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offers);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final String searchTerm;
  @override
  final int? nextCursor;
  @override
  final String? error;

  @override
  String toString() {
    return 'SearchOffersState(offers: $offers, isLoading: $isLoading, hasMore: $hasMore, searchTerm: $searchTerm, nextCursor: $nextCursor, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchOffersStateImpl &&
            const DeepCollectionEquality().equals(other._offers, _offers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_offers),
      isLoading,
      hasMore,
      searchTerm,
      nextCursor,
      error);

  /// Create a copy of SearchOffersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchOffersStateImplCopyWith<_$SearchOffersStateImpl> get copyWith =>
      __$$SearchOffersStateImplCopyWithImpl<_$SearchOffersStateImpl>(
          this, _$identity);
}

abstract class _SearchOffersState implements SearchOffersState {
  const factory _SearchOffersState(
      {final List<OfferModel> offers,
      final bool isLoading,
      final bool hasMore,
      final String searchTerm,
      final int? nextCursor,
      final String? error}) = _$SearchOffersStateImpl;

  @override
  List<OfferModel> get offers;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  String get searchTerm;
  @override
  int? get nextCursor;
  @override
  String? get error;

  /// Create a copy of SearchOffersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchOffersStateImplCopyWith<_$SearchOffersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
