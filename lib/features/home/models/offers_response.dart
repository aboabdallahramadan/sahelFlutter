import 'package:freezed_annotation/freezed_annotation.dart';
import 'offer_model.dart';

part 'offers_response.freezed.dart';
part 'offers_response.g.dart';

@freezed
class OffersResponse with _$OffersResponse {
  const factory OffersResponse({
    required List<OfferModel> items,
    required bool hasMore,
    int? nextCursor,
  }) = _OffersResponse;

  factory OffersResponse.fromJson(Map<String, dynamic> json) =>
      _$OffersResponseFromJson(json);
}
