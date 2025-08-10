import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_offer.freezed.dart';
part 'profile_offer.g.dart';

@freezed
class ProfileOffer with _$ProfileOffer {
  const factory ProfileOffer({
    required int id,
    required String name,
    required String description,
    required double price,
    required int categoryId,
    required String categoryName,
    required int regionId,
    required String regionName,
    required String mainImageUrl,
    required String createdAt,
  }) = _ProfileOffer;

  factory ProfileOffer.fromJson(Map<String, dynamic> json) =>
      _$ProfileOfferFromJson(json);
}
