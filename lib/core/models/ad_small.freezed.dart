// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_small.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdSmall _$AdSmallFromJson(Map<String, dynamic> json) {
  return _AdSmall.fromJson(json);
}

/// @nodoc
mixin _$AdSmall {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get timeAgo => throw _privateConstructorUsedError;

  /// Serializes this AdSmall to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdSmall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdSmallCopyWith<AdSmall> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdSmallCopyWith<$Res> {
  factory $AdSmallCopyWith(AdSmall value, $Res Function(AdSmall) then) =
      _$AdSmallCopyWithImpl<$Res, AdSmall>;
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String image,
      int comments,
      int likes,
      String? location,
      String? timeAgo});
}

/// @nodoc
class _$AdSmallCopyWithImpl<$Res, $Val extends AdSmall>
    implements $AdSmallCopyWith<$Res> {
  _$AdSmallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdSmall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? image = null,
    Object? comments = null,
    Object? likes = null,
    Object? location = freezed,
    Object? timeAgo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdSmallImplCopyWith<$Res> implements $AdSmallCopyWith<$Res> {
  factory _$$AdSmallImplCopyWith(
          _$AdSmallImpl value, $Res Function(_$AdSmallImpl) then) =
      __$$AdSmallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String image,
      int comments,
      int likes,
      String? location,
      String? timeAgo});
}

/// @nodoc
class __$$AdSmallImplCopyWithImpl<$Res>
    extends _$AdSmallCopyWithImpl<$Res, _$AdSmallImpl>
    implements _$$AdSmallImplCopyWith<$Res> {
  __$$AdSmallImplCopyWithImpl(
      _$AdSmallImpl _value, $Res Function(_$AdSmallImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdSmall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? image = null,
    Object? comments = null,
    Object? likes = null,
    Object? location = freezed,
    Object? timeAgo = freezed,
  }) {
    return _then(_$AdSmallImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdSmallImpl implements _AdSmall {
  const _$AdSmallImpl(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.comments,
      required this.likes,
      this.location,
      this.timeAgo});

  factory _$AdSmallImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdSmallImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String image;
  @override
  final int comments;
  @override
  final int likes;
  @override
  final String? location;
  @override
  final String? timeAgo;

  @override
  String toString() {
    return 'AdSmall(id: $id, title: $title, price: $price, image: $image, comments: $comments, likes: $likes, location: $location, timeAgo: $timeAgo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdSmallImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, image, comments, likes, location, timeAgo);

  /// Create a copy of AdSmall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdSmallImplCopyWith<_$AdSmallImpl> get copyWith =>
      __$$AdSmallImplCopyWithImpl<_$AdSmallImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdSmallImplToJson(
      this,
    );
  }
}

abstract class _AdSmall implements AdSmall {
  const factory _AdSmall(
      {required final String id,
      required final String title,
      required final double price,
      required final String image,
      required final int comments,
      required final int likes,
      final String? location,
      final String? timeAgo}) = _$AdSmallImpl;

  factory _AdSmall.fromJson(Map<String, dynamic> json) = _$AdSmallImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get price;
  @override
  String get image;
  @override
  int get comments;
  @override
  int get likes;
  @override
  String? get location;
  @override
  String? get timeAgo;

  /// Create a copy of AdSmall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdSmallImplCopyWith<_$AdSmallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
