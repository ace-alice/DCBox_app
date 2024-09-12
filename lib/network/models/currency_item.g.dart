// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyItem _$CurrencyItemFromJson(Map<String, dynamic> json) => CurrencyItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      currency: json['currency'] as String? ?? '',
      protocols: (json['protocols'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      protocolList: (json['protocolList'] as List<dynamic>?)
              ?.map((e) => ProtocolList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      type: (json['type'] as num?)?.toInt() ?? 0,
      decimalLength: (json['decimalLength'] as num?)?.toInt() ?? 0,
      minTransferAmount: (json['minTransferAmount'] as num?)?.toInt() ?? 0,
      minWithdrawalAmount: json['minWithdrawalAmount'],
      maxWithdrawalAmount: json['maxWithdrawalAmount'],
      isDcBox: json['isDcBox'] as String? ?? '',
    );

Map<String, dynamic> _$CurrencyItemToJson(CurrencyItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'protocols': instance.protocols,
      'protocolList': instance.protocolList,
      'type': instance.type,
      'decimalLength': instance.decimalLength,
      'minTransferAmount': instance.minTransferAmount,
      'minWithdrawalAmount': instance.minWithdrawalAmount,
      'maxWithdrawalAmount': instance.maxWithdrawalAmount,
      'isDcBox': instance.isDcBox,
    };

ProtocolList _$ProtocolListFromJson(Map<String, dynamic> json) => ProtocolList(
      protocol: json['protocol'] as String? ?? '',
      decimalLength: (json['decimalLength'] as num?)?.toInt() ?? 0,
      internalWithdrawalFee:
          (json['internalWithdrawalFee'] as num?)?.toInt() ?? 0,
      externalWithdrawalFee:
          (json['externalWithdrawalFee'] as num?)?.toInt() ?? 0,
      minWithdrawalAmount: (json['minWithdrawalAmount'] as num?)?.toInt() ?? 0,
      withdrawalFlag: (json['withdrawalFlag'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProtocolListToJson(ProtocolList instance) =>
    <String, dynamic>{
      'protocol': instance.protocol,
      'decimalLength': instance.decimalLength,
      'internalWithdrawalFee': instance.internalWithdrawalFee,
      'externalWithdrawalFee': instance.externalWithdrawalFee,
      'minWithdrawalAmount': instance.minWithdrawalAmount,
      'withdrawalFlag': instance.withdrawalFlag,
    };
