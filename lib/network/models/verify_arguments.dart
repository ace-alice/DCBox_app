import 'package:json_annotation/json_annotation.dart';

part 'verify_arguments.g.dart';

@JsonSerializable()
class VerifyArguments {
  @JsonKey(defaultValue: [])
  final List<int> verifyTypes;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String countryCode;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: 0)
  final int verifyType;
  @JsonKey(defaultValue: '')
  final String captchaVerifyId;
  @JsonKey(defaultValue: 'LOGIN')
  final String bizType;
  final String? token;

  const VerifyArguments({
    required this.verifyTypes,
    required this.phone,
    required this.countryCode,
    required this.email,
    required this.verifyType,
    required this.captchaVerifyId,
    required this.bizType,
    this.token,
  });

  factory VerifyArguments.fromJson(Map<String, dynamic> json) =>
      _$VerifyArgumentsFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyArgumentsToJson(this);
}
