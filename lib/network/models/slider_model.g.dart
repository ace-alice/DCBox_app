// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      x: (json['x'] as num?)?.toInt() ?? 0,
      y: (json['y'] as num?)?.toInt() ?? 0,
      originImage: json['originImage'] as String? ?? '',
      shadeImage: json['shadeImage'] as String? ?? '',
      cutoutImage: json['cutoutImage'] as String? ?? '',
      captchaId: json['captchaId'] as String? ?? '',
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'originImage': instance.originImage,
      'shadeImage': instance.shadeImage,
      'cutoutImage': instance.cutoutImage,
      'captchaId': instance.captchaId,
    };
