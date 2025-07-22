import 'package:freezed_annotation/freezed_annotation.dart';
import 'ad_comment.dart';
import 'ad_details.dart';
import 'ad_user.dart';
import 'ad_small.dart';

part 'ad.freezed.dart';
part 'ad.g.dart';

@freezed
class Ad with _$Ad {
  const factory Ad({
    required String id,
    required List<String> images,
    required AdDetails adDetails,
    required AdUser user,
    required List<AdComment> comments,
    required List<AdSmall> similarAds,
  }) = _Ad;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
} 