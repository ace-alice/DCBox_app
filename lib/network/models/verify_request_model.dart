import 'package:json_annotation/json_annotation.dart';

part 'verify_request_model.g.dart';

@JsonSerializable()
class VerifyRequestModel {
  @JsonKey(defaultValue: false)
  final bool success;
  @JsonKey(defaultValue: '')
  final String securityId;
  @JsonKey(defaultValue: 0)
  final int duration;
  @JsonKey(defaultValue: 0)
  final int verifyType;
  @JsonKey(defaultValue: false)
  final bool hasMaxErrorCount;

  const VerifyRequestModel({
    required this.success,
    required this.securityId,
    required this.duration,
    required this.verifyType,
    required this.hasMaxErrorCount,
  });

  factory VerifyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestModelToJson(this);
}
