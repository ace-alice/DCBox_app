import 'package:json_annotation/json_annotation.dart';

part 'pre_login_model.g.dart';

@JsonSerializable()
class PreLoginModel {
  @JsonKey(defaultValue: '')
  final String token;
  @JsonKey(defaultValue: [])
  final List<int> verifyTypes;
  final dynamic phone;
  final dynamic countryCode;
  final dynamic email;
  @JsonKey(defaultValue: false)
  final bool dcboxFirstLogin;
  final dynamic isRegister;
  final dynamic loginName;
  final dynamic appId;
  @JsonKey(defaultValue: false)
  final bool whetherBindSuperior;

  const PreLoginModel({
    required this.token,
    required this.verifyTypes,
    this.phone,
    this.countryCode,
    this.email,
    required this.dcboxFirstLogin,
    this.isRegister,
    this.loginName,
    this.appId,
    required this.whetherBindSuperior,
  });

  factory PreLoginModel.fromJson(Map<String, dynamic> json) =>
      _$PreLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreLoginModelToJson(this);
}
