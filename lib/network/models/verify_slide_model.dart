import 'package:json_annotation/json_annotation.dart';

part 'verify_slide_model.g.dart';

@JsonSerializable()
class VerifySlideModel {
  @JsonKey(defaultValue: false)
  final bool success;
  @JsonKey(defaultValue: '')
  final String captchaVerifyId;
  @JsonKey(defaultValue: 0)
  final int during;

  const VerifySlideModel({
    required this.success,
    required this.captchaVerifyId,
    required this.during,
  });

  factory VerifySlideModel.fromJson(Map<String, dynamic> json) =>
      _$VerifySlideModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySlideModelToJson(this);
}
