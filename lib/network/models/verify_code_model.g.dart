// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeModel _$VerifyCodeModelFromJson(Map<String, dynamic> json) =>
    VerifyCodeModel(
      success: json['success'] as bool? ?? false,
      requestId: json['requestId'] as String? ?? '',
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$VerifyCodeModelToJson(VerifyCodeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'requestId': instance.requestId,
      'duration': instance.duration,
      'code': instance.code,
    };
