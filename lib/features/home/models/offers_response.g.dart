// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OffersResponseImpl _$$OffersResponseImplFromJson(Map<String, dynamic> json) =>
    _$OffersResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      nextCursor: (json['nextCursor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OffersResponseImplToJson(
        _$OffersResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'hasMore': instance.hasMore,
      'nextCursor': instance.nextCursor,
    };
