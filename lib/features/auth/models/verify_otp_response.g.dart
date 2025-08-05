// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpResponseImpl _$$VerifyOtpResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpResponseImpl(
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifyOtpResponseImplToJson(
        _$VerifyOtpResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
