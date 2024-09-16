import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  @JsonKey(defaultValue: 0)
  final int x;
  @JsonKey(defaultValue: 0)
  final int y;
  @JsonKey(defaultValue: '')
  final String originImage;
  @JsonKey(defaultValue: '')
  final String shadeImage;
  @JsonKey(defaultValue: '')
  final String cutoutImage;
  @JsonKey(defaultValue: '')
  final String captchaId;

  const SliderModel({
    required this.x,
    required this.y,
    required this.originImage,
    required this.shadeImage,
    required this.cutoutImage,
    required this.captchaId,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
