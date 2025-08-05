// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) {
  return _RegionModel.fromJson(json);
}

/// @nodoc
mixin _$RegionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  String? get parentName => throw _privateConstructorUsedError;
  bool get hasSubRegions => throw _privateConstructorUsedError;

  /// Serializes this RegionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionModelCopyWith<RegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionModelCopyWith<$Res> {
  factory $RegionModelCopyWith(
          RegionModel value, $Res Function(RegionModel) then) =
      _$RegionModelCopyWithImpl<$Res, RegionModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int? parentId,
      String? parentName,
      bool hasSubRegions});
}

/// @nodoc
class _$RegionModelCopyWithImpl<$Res, $Val extends RegionModel>
    implements $RegionModelCopyWith<$Res> {
  _$RegionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? parentName = freezed,
    Object? hasSubRegions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSubRegions: null == hasSubRegions
          ? _value.hasSubRegions
          : hasSubRegions // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionModelImplCopyWith<$Res>
    implements $RegionModelCopyWith<$Res> {
  factory _$$RegionModelImplCopyWith(
          _$RegionModelImpl value, $Res Function(_$RegionModelImpl) then) =
      __$$RegionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int? parentId,
      String? parentName,
      bool hasSubRegions});
}

/// @nodoc
class __$$RegionModelImplCopyWithImpl<$Res>
    extends _$RegionModelCopyWithImpl<$Res, _$RegionModelImpl>
    implements _$$RegionModelImplCopyWith<$Res> {
  __$$RegionModelImplCopyWithImpl(
      _$RegionModelImpl _value, $Res Function(_$RegionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? parentName = freezed,
    Object? hasSubRegions = null,
  }) {
    return _then(_$RegionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSubRegions: null == hasSubRegions
          ? _value.hasSubRegions
          : hasSubRegions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionModelImpl implements _RegionModel {
  const _$RegionModelImpl(
      {required this.id,
      required this.name,
      this.parentId,
      this.parentName,
      required this.hasSubRegions});

  factory _$RegionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? parentId;
  @override
  final String? parentName;
  @override
  final bool hasSubRegions;

  @override
  String toString() {
    return 'RegionModel(id: $id, name: $name, parentId: $parentId, parentName: $parentName, hasSubRegions: $hasSubRegions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.hasSubRegions, hasSubRegions) ||
                other.hasSubRegions == hasSubRegions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, parentId, parentName, hasSubRegions);

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      __$$RegionModelImplCopyWithImpl<_$RegionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionModelImplToJson(
      this,
    );
  }
}

abstract class _RegionModel implements RegionModel {
  const factory _RegionModel(
      {required final int id,
      required final String name,
      final int? parentId,
      final String? parentName,
      required final bool hasSubRegions}) = _$RegionModelImpl;

  factory _RegionModel.fromJson(Map<String, dynamic> json) =
      _$RegionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get parentId;
  @override
  String? get parentName;
  @override
  bool get hasSubRegions;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
