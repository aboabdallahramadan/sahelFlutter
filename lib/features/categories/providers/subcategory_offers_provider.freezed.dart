// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subcategory_offers_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubcategoryFilterParams {
  int get categoryId => throw _privateConstructorUsedError;
  int? get regionId => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  String? get searchTerm => throw _privateConstructorUsedError;

  /// Create a copy of SubcategoryFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubcategoryFilterParamsCopyWith<SubcategoryFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryFilterParamsCopyWith<$Res> {
  factory $SubcategoryFilterParamsCopyWith(SubcategoryFilterParams value,
          $Res Function(SubcategoryFilterParams) then) =
      _$SubcategoryFilterParamsCopyWithImpl<$Res, SubcategoryFilterParams>;
  @useResult
  $Res call(
      {int categoryId,
      int? regionId,
      double? minPrice,
      double? maxPrice,
      String? searchTerm});
}

/// @nodoc
class _$SubcategoryFilterParamsCopyWithImpl<$Res,
        $Val extends SubcategoryFilterParams>
    implements $SubcategoryFilterParamsCopyWith<$Res> {
  _$SubcategoryFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubcategoryFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? regionId = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? searchTerm = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubcategoryFilterParamsImplCopyWith<$Res>
    implements $SubcategoryFilterParamsCopyWith<$Res> {
  factory _$$SubcategoryFilterParamsImplCopyWith(
          _$SubcategoryFilterParamsImpl value,
          $Res Function(_$SubcategoryFilterParamsImpl) then) =
      __$$SubcategoryFilterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      int? regionId,
      double? minPrice,
      double? maxPrice,
      String? searchTerm});
}

/// @nodoc
class __$$SubcategoryFilterParamsImplCopyWithImpl<$Res>
    extends _$SubcategoryFilterParamsCopyWithImpl<$Res,
        _$SubcategoryFilterParamsImpl>
    implements _$$SubcategoryFilterParamsImplCopyWith<$Res> {
  __$$SubcategoryFilterParamsImplCopyWithImpl(
      _$SubcategoryFilterParamsImpl _value,
      $Res Function(_$SubcategoryFilterParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubcategoryFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? regionId = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? searchTerm = freezed,
  }) {
    return _then(_$SubcategoryFilterParamsImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubcategoryFilterParamsImpl implements _SubcategoryFilterParams {
  const _$SubcategoryFilterParamsImpl(
      {required this.categoryId,
      this.regionId,
      this.minPrice,
      this.maxPrice,
      this.searchTerm});

  @override
  final int categoryId;
  @override
  final int? regionId;
  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  @override
  final String? searchTerm;

  @override
  String toString() {
    return 'SubcategoryFilterParams(categoryId: $categoryId, regionId: $regionId, minPrice: $minPrice, maxPrice: $maxPrice, searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubcategoryFilterParamsImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, regionId, minPrice, maxPrice, searchTerm);

  /// Create a copy of SubcategoryFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubcategoryFilterParamsImplCopyWith<_$SubcategoryFilterParamsImpl>
      get copyWith => __$$SubcategoryFilterParamsImplCopyWithImpl<
          _$SubcategoryFilterParamsImpl>(this, _$identity);
}

abstract class _SubcategoryFilterParams implements SubcategoryFilterParams {
  const factory _SubcategoryFilterParams(
      {required final int categoryId,
      final int? regionId,
      final double? minPrice,
      final double? maxPrice,
      final String? searchTerm}) = _$SubcategoryFilterParamsImpl;

  @override
  int get categoryId;
  @override
  int? get regionId;
  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  String? get searchTerm;

  /// Create a copy of SubcategoryFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubcategoryFilterParamsImplCopyWith<_$SubcategoryFilterParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
