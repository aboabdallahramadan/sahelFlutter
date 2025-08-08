import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_detail_response.freezed.dart';
part 'ad_detail_response.g.dart';

@freezed
class AdDetailResponse with _$AdDetailResponse {
  const factory AdDetailResponse({
    required int id,
    required String name,
    required String description,
    required double price,
    required int categoryId,
    required String categoryName,
    required int regionId,
    required String regionName,
    required String mainImageUrl,
    @Default([]) List<String> additionalImages,
    required DateTime createdAt,
    required bool isActive,
    required int providerId,
    required String providerName,
    required String providerPhoneNumber,
    required String providerProfilePhotoUrl,
    required String providerCreatedAt,
    required bool isFavorite,
    required int numberOfFavorites,
    required int numberOfViews,
    required bool providerIsFollowed,
  }) = _AdDetailResponse;

  factory AdDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AdDetailResponseFromJson(json);
}
