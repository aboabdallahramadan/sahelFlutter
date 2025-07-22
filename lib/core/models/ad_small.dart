import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_small.freezed.dart';
part 'ad_small.g.dart';

@freezed
class AdSmall with _$AdSmall {
  const factory AdSmall({
    required String id,
    required String title,
    required double price,
    required String image,
    required int comments,
    required int likes,
    String? location,
    String? timeAgo,
  }) = _AdSmall;

  factory AdSmall.fromJson(Map<String, dynamic> json) =>
      _$AdSmallFromJson(json);
} 