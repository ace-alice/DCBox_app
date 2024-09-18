// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyArguments _$VerifyArgumentsFromJson(Map<String, dynamic> json) =>
    VerifyArguments(
      verifyTypes: (json['verifyTypes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      phone: json['phone'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      email: json['email'] as String? ?? '',
      verifyType: (json['verifyType'] as num?)?.toInt() ?? 0,
      captchaVerifyId: json['captchaVerifyId'] as String? ?? '',
      bizType: json['bizType'] as String? ?? 'LOGIN',
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyArgumentsToJson(VerifyArguments instance) =>
    <String, dynamic>{
      'verifyTypes': instance.verifyTypes,
      'phone': instance.phone,
      'countryCode': instance.countryCode,
      'email': instance.email,
      'verifyType': instance.verifyType,
      'captchaVerifyId': instance.captchaVerifyId,
      'bizType': instance.bizType,
      'token': instance.token,
    };
