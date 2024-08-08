// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerImage _$BannerImageFromJson(Map<String, dynamic> json) => BannerImage(
      code: json['code'] as String? ?? '',
      imgurl: json['imgurl'] as String? ?? '',
      width: json['width'] as String? ?? '',
      height: json['height'] as String? ?? '',
    );

Map<String, dynamic> _$BannerImageToJson(BannerImage instance) =>
    <String, dynamic>{
      'code': instance.code,
      'imgurl': instance.imgurl,
      'width': instance.width,
      'height': instance.height,
    };
