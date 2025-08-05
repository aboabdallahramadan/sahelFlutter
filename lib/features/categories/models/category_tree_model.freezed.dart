// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_tree_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryTreeModel _$CategoryTreeModelFromJson(Map<String, dynamic> json) {
  return _CategoryTreeModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryTreeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<SubCategoryModel> get subCategories =>
      throw _privateConstructorUsedError;

  /// Serializes this CategoryTreeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryTreeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryTreeModelCopyWith<CategoryTreeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTreeModelCopyWith<$Res> {
  factory $CategoryTreeModelCopyWith(
          CategoryTreeModel value, $Res Function(CategoryTreeModel) then) =
      _$CategoryTreeModelCopyWithImpl<$Res, CategoryTreeModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      List<SubCategoryModel> subCategories});
}

/// @nodoc
class _$CategoryTreeModelCopyWithImpl<$Res, $Val extends CategoryTreeModel>
    implements $CategoryTreeModelCopyWith<$Res> {
  _$CategoryTreeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryTreeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? subCategories = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subCategories: null == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryTreeModelImplCopyWith<$Res>
    implements $CategoryTreeModelCopyWith<$Res> {
  factory _$$CategoryTreeModelImplCopyWith(_$CategoryTreeModelImpl value,
          $Res Function(_$CategoryTreeModelImpl) then) =
      __$$CategoryTreeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      List<SubCategoryModel> subCategories});
}

/// @nodoc
class __$$CategoryTreeModelImplCopyWithImpl<$Res>
    extends _$CategoryTreeModelCopyWithImpl<$Res, _$CategoryTreeModelImpl>
    implements _$$CategoryTreeModelImplCopyWith<$Res> {
  __$$CategoryTreeModelImplCopyWithImpl(_$CategoryTreeModelImpl _value,
      $Res Function(_$CategoryTreeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryTreeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? subCategories = null,
  }) {
    return _then(_$CategoryTreeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subCategories: null == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryTreeModelImpl implements _CategoryTreeModel {
  const _$CategoryTreeModelImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      final List<SubCategoryModel> subCategories = const []})
      : _subCategories = subCategories;

  factory _$CategoryTreeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryTreeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  final List<SubCategoryModel> _subCategories;
  @override
  @JsonKey()
  List<SubCategoryModel> get subCategories {
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategories);
  }

  @override
  String toString() {
    return 'CategoryTreeModel(id: $id, name: $name, imageUrl: $imageUrl, subCategories: $subCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryTreeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl,
      const DeepCollectionEquality().hash(_subCategories));

  /// Create a copy of CategoryTreeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryTreeModelImplCopyWith<_$CategoryTreeModelImpl> get copyWith =>
      __$$CategoryTreeModelImplCopyWithImpl<_$CategoryTreeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryTreeModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryTreeModel implements CategoryTreeModel {
  const factory _CategoryTreeModel(
      {required final int id,
      required final String name,
      required final String imageUrl,
      final List<SubCategoryModel> subCategories}) = _$CategoryTreeModelImpl;

  factory _CategoryTreeModel.fromJson(Map<String, dynamic> json) =
      _$CategoryTreeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  List<SubCategoryModel> get subCategories;

  /// Create a copy of CategoryTreeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryTreeModelImplCopyWith<_$CategoryTreeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) {
  return _SubCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SubCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this SubCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubCategoryModelCopyWith<SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryModelCopyWith<$Res> {
  factory $SubCategoryModelCopyWith(
          SubCategoryModel value, $Res Function(SubCategoryModel) then) =
      _$SubCategoryModelCopyWithImpl<$Res, SubCategoryModel>;
  @useResult
  $Res call({int id, String name, String imageUrl});
}

/// @nodoc
class _$SubCategoryModelCopyWithImpl<$Res, $Val extends SubCategoryModel>
    implements $SubCategoryModelCopyWith<$Res> {
  _$SubCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoryModelImplCopyWith<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  factory _$$SubCategoryModelImplCopyWith(_$SubCategoryModelImpl value,
          $Res Function(_$SubCategoryModelImpl) then) =
      __$$SubCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String imageUrl});
}

/// @nodoc
class __$$SubCategoryModelImplCopyWithImpl<$Res>
    extends _$SubCategoryModelCopyWithImpl<$Res, _$SubCategoryModelImpl>
    implements _$$SubCategoryModelImplCopyWith<$Res> {
  __$$SubCategoryModelImplCopyWithImpl(_$SubCategoryModelImpl _value,
      $Res Function(_$SubCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$SubCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCategoryModelImpl implements _SubCategoryModel {
  const _$SubCategoryModelImpl(
      {required this.id, required this.name, required this.imageUrl});

  factory _$SubCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  /// Create a copy of SubCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryModelImplCopyWith<_$SubCategoryModelImpl> get copyWith =>
      __$$SubCategoryModelImplCopyWithImpl<_$SubCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _SubCategoryModel implements SubCategoryModel {
  const factory _SubCategoryModel(
      {required final int id,
      required final String name,
      required final String imageUrl}) = _$SubCategoryModelImpl;

  factory _SubCategoryModel.fromJson(Map<String, dynamic> json) =
      _$SubCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;

  /// Create a copy of SubCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubCategoryModelImplCopyWith<_$SubCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
