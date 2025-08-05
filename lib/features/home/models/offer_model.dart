import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    required int id,
    required String name,
    required String description,
    required double price,
    required int categoryId,
    required String categoryName,
    required int regionId,
    required String regionName,
    required String mainImageUrl,
    required DateTime createdAt,
    required int numberOfFavorites,
    required int numberOfViews,
    required int numberOfComments,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
