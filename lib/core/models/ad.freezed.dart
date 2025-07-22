// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ad _$AdFromJson(Map<String, dynamic> json) {
  return _Ad.fromJson(json);
}

/// @nodoc
mixin _$Ad {
  String get id => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  AdDetails get adDetails => throw _privateConstructorUsedError;
  AdUser get user => throw _privateConstructorUsedError;
  List<AdComment> get comments => throw _privateConstructorUsedError;
  List<AdSmall> get similarAds => throw _privateConstructorUsedError;

  /// Serializes this Ad to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdCopyWith<Ad> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdCopyWith<$Res> {
  factory $AdCopyWith(Ad value, $Res Function(Ad) then) =
      _$AdCopyWithImpl<$Res, Ad>;
  @useResult
  $Res call(
      {String id,
      List<String> images,
      AdDetails adDetails,
      AdUser user,
      List<AdComment> comments,
      List<AdSmall> similarAds});

  $AdDetailsCopyWith<$Res> get adDetails;
  $AdUserCopyWith<$Res> get user;
}

/// @nodoc
class _$AdCopyWithImpl<$Res, $Val extends Ad> implements $AdCopyWith<$Res> {
  _$AdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? images = null,
    Object? adDetails = null,
    Object? user = null,
    Object? comments = null,
    Object? similarAds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      adDetails: null == adDetails
          ? _value.adDetails
          : adDetails // ignore: cast_nullable_to_non_nullable
              as AdDetails,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AdUser,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<AdComment>,
      similarAds: null == similarAds
          ? _value.similarAds
          : similarAds // ignore: cast_nullable_to_non_nullable
              as List<AdSmall>,
    ) as $Val);
  }

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdDetailsCopyWith<$Res> get adDetails {
    return $AdDetailsCopyWith<$Res>(_value.adDetails, (value) {
      return _then(_value.copyWith(adDetails: value) as $Val);
    });
  }

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdUserCopyWith<$Res> get user {
    return $AdUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdImplCopyWith<$Res> implements $AdCopyWith<$Res> {
  factory _$$AdImplCopyWith(_$AdImpl value, $Res Function(_$AdImpl) then) =
      __$$AdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> images,
      AdDetails adDetails,
      AdUser user,
      List<AdComment> comments,
      List<AdSmall> similarAds});

  @override
  $AdDetailsCopyWith<$Res> get adDetails;
  @override
  $AdUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AdImplCopyWithImpl<$Res> extends _$AdCopyWithImpl<$Res, _$AdImpl>
    implements _$$AdImplCopyWith<$Res> {
  __$$AdImplCopyWithImpl(_$AdImpl _value, $Res Function(_$AdImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? images = null,
    Object? adDetails = null,
    Object? user = null,
    Object? comments = null,
    Object? similarAds = null,
  }) {
    return _then(_$AdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      adDetails: null == adDetails
          ? _value.adDetails
          : adDetails // ignore: cast_nullable_to_non_nullable
              as AdDetails,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AdUser,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<AdComment>,
      similarAds: null == similarAds
          ? _value._similarAds
          : similarAds // ignore: cast_nullable_to_non_nullable
              as List<AdSmall>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdImpl implements _Ad {
  const _$AdImpl(
      {required this.id,
      required final List<String> images,
      required this.adDetails,
      required this.user,
      required final List<AdComment> comments,
      required final List<AdSmall> similarAds})
      : _images = images,
        _comments = comments,
        _similarAds = similarAds;

  factory _$AdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdImplFromJson(json);

  @override
  final String id;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final AdDetails adDetails;
  @override
  final AdUser user;
  final List<AdComment> _comments;
  @override
  List<AdComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<AdSmall> _similarAds;
  @override
  List<AdSmall> get similarAds {
    if (_similarAds is EqualUnmodifiableListView) return _similarAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarAds);
  }

  @override
  String toString() {
    return 'Ad(id: $id, images: $images, adDetails: $adDetails, user: $user, comments: $comments, similarAds: $similarAds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.adDetails, adDetails) ||
                other.adDetails == adDetails) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality()
                .equals(other._similarAds, _similarAds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_images),
      adDetails,
      user,
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_similarAds));

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      __$$AdImplCopyWithImpl<_$AdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdImplToJson(
      this,
    );
  }
}

abstract class _Ad implements Ad {
  const factory _Ad(
      {required final String id,
      required final List<String> images,
      required final AdDetails adDetails,
      required final AdUser user,
      required final List<AdComment> comments,
      required final List<AdSmall> similarAds}) = _$AdImpl;

  factory _Ad.fromJson(Map<String, dynamic> json) = _$AdImpl.fromJson;

  @override
  String get id;
  @override
  List<String> get images;
  @override
  AdDetails get adDetails;
  @override
  AdUser get user;
  @override
  List<AdComment> get comments;
  @override
  List<AdSmall> get similarAds;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
