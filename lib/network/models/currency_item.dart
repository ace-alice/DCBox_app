import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../generated/app_image/app_image.dart';

part 'currency_item.g.dart';

@JsonSerializable()
class CurrencyItem {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String currency;
  @JsonKey(defaultValue: [])
  final List<String> protocols;
  @JsonKey(defaultValue: [])
  final List<ProtocolList> protocolList;
  @JsonKey(defaultValue: 0)
  final int type;
  @JsonKey(defaultValue: 0)
  final int decimalLength;
  @JsonKey(defaultValue: 0)
  final int minTransferAmount;
  final dynamic minWithdrawalAmount;
  final dynamic maxWithdrawalAmount;
  @JsonKey(defaultValue: '')
  final String isDcBox;

  const CurrencyItem({
    required this.id,
    required this.currency,
    required this.protocols,
    required this.protocolList,
    required this.type,
    required this.decimalLength,
    required this.minTransferAmount,
    this.minWithdrawalAmount,
    this.maxWithdrawalAmount,
    required this.isDcBox,
  });

  factory CurrencyItem.fromJson(Map<String, dynamic> json) =>
      _$CurrencyItemFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyItemToJson(this);

  Widget getIcon({
    BoxFit fit = BoxFit.contain,
    double? width = 24,
    double? height = 24,
  }) {
    return AppImage.currency.getImageWith(
      name: currency,
      fit: fit,
      width: width,
      height: height,
    );
  }
}

@JsonSerializable()
class ProtocolList {
  @JsonKey(defaultValue: '')
  final String protocol;
  @JsonKey(defaultValue: 0)
  final int decimalLength;
  @JsonKey(defaultValue: 0)
  final int internalWithdrawalFee;
  @JsonKey(defaultValue: 0)
  final int externalWithdrawalFee;
  @JsonKey(defaultValue: 0)
  final int minWithdrawalAmount;
  @JsonKey(defaultValue: 0)
  final int withdrawalFlag;

  const ProtocolList({
    required this.protocol,
    required this.decimalLength,
    required this.internalWithdrawalFee,
    required this.externalWithdrawalFee,
    required this.minWithdrawalAmount,
    required this.withdrawalFlag,
  });

  factory ProtocolList.fromJson(Map<String, dynamic> json) =>
      _$ProtocolListFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolListToJson(this);
}
