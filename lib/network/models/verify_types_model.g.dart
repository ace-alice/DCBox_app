// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyTypesModel _$VerifyTypesModelFromJson(Map<String, dynamic> json) =>
    VerifyTypesModel(
      verifyTypes: (json['verifyTypes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      needCaptcha: json['needCaptcha'] as bool? ?? false,
    );

Map<String, dynamic> _$VerifyTypesModelToJson(VerifyTypesModel instance) =>
    <String, dynamic>{
      'verifyTypes': instance.verifyTypes,
      'needCaptcha': instance.needCaptcha,
    };
