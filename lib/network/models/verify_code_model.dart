import 'package:json_annotation/json_annotation.dart';

part 'verify_code_model.g.dart';

@JsonSerializable()
class VerifyCodeModel {
  @JsonKey(defaultValue: false)
  final bool success;
  @JsonKey(defaultValue: '')
  final String requestId;
  @JsonKey(defaultValue: 0)
  final int duration;
  @JsonKey(defaultValue: '')
  final String code;

  const VerifyCodeModel({
    required this.success,
    required this.requestId,
    required this.duration,
    required this.code,
  });

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeModelToJson(this);
}
