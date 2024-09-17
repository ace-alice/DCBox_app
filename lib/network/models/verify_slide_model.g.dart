// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_slide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySlideModel _$VerifySlideModelFromJson(Map<String, dynamic> json) =>
    VerifySlideModel(
      success: json['success'] as bool? ?? false,
      captchaVerifyId: json['captchaVerifyId'] as String? ?? '',
      during: (json['during'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VerifySlideModelToJson(VerifySlideModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'captchaVerifyId': instance.captchaVerifyId,
      'during': instance.during,
    };
