// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRequestModel _$VerifyRequestModelFromJson(Map<String, dynamic> json) =>
    VerifyRequestModel(
      success: json['success'] as bool? ?? false,
      securityId: json['securityId'] as String? ?? '',
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      verifyType: (json['verifyType'] as num?)?.toInt() ?? 0,
      hasMaxErrorCount: json['hasMaxErrorCount'] as bool? ?? false,
    );

Map<String, dynamic> _$VerifyRequestModelToJson(VerifyRequestModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'securityId': instance.securityId,
      'duration': instance.duration,
      'verifyType': instance.verifyType,
      'hasMaxErrorCount': instance.hasMaxErrorCount,
    };
