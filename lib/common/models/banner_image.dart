import 'package:json_annotation/json_annotation.dart';

part 'banner_image.g.dart';

@JsonSerializable()
class BannerImage {
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String imgurl;
  @JsonKey(defaultValue: '')
  final String width;
  @JsonKey(defaultValue: '')
  final String height;

  const BannerImage({
    required this.code,
    required this.imgurl,
    required this.width,
    required this.height,
  });

  factory BannerImage.fromJson(Map<String, dynamic> json) =>
      _$BannerImageFromJson(json);

  Map<String, dynamic> toJson() => _$BannerImageToJson(this);
}
