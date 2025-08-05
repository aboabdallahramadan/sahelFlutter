// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpRequestImpl _$$VerifyOtpRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpRequestImpl(
      userId: (json['userId'] as num).toInt(),
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$VerifyOtpRequestImplToJson(
        _$VerifyOtpRequestImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'otp': instance.otp,
    };
