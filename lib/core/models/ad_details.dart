import 'package:freezed_annotation/freezed_annotation.dart';
import 'extra_info.dart';

part 'ad_details.freezed.dart';
part 'ad_details.g.dart';

@freezed
class AdDetails with _$AdDetails {
  const factory AdDetails({
    required String title,
    required double price,
    required String category,
    required String subcategory,
    required String location,
    required String timeAgo,
    required List<ExtraInfo> extraInfo,
    required int likes,
    required int views,
    required String description,
  }) = _AdDetails;

  factory AdDetails.fromJson(Map<String, dynamic> json) =>
      _$AdDetailsFromJson(json);
} 