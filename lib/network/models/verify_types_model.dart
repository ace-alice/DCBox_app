import 'package:json_annotation/json_annotation.dart';

part 'verify_types_model.g.dart';

@JsonSerializable()
class VerifyTypesModel {
  @JsonKey(defaultValue: [])
  final List<int> verifyTypes;
  @JsonKey(defaultValue: false)
  final bool needCaptcha;

  const VerifyTypesModel({
    required this.verifyTypes,
    required this.needCaptcha,
  });

  factory VerifyTypesModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyTypesModelToJson(this);
}
