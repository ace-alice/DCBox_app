// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBalanceModel _$UserBalanceModelFromJson(Map<String, dynamic> json) =>
    UserBalanceModel(
      balanceList: (json['balanceList'] as List<dynamic>?)
              ?.map((e) => BalanceList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      balanceByUSDT: (json['balanceByUSDT'] as num?)?.toDouble() ?? 0,
      balanceByCNY: (json['balanceByCNY'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$UserBalanceModelToJson(UserBalanceModel instance) =>
    <String, dynamic>{
      'balanceList': instance.balanceList,
      'balanceByUSDT': instance.balanceByUSDT,
      'balanceByCNY': instance.balanceByCNY,
    };

BalanceList _$BalanceListFromJson(Map<String, dynamic> json) => BalanceList(
      currency: json['currency'] as String? ?? '',
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble() ?? 0,
      exchangeCurrency: json['exchangeCurrency'] as String? ?? '',
      exchangeBalance: (json['exchangeBalance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$BalanceListToJson(BalanceList instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'balance': instance.balance,
      'exchangeRate': instance.exchangeRate,
      'exchangeCurrency': instance.exchangeCurrency,
      'exchangeBalance': instance.exchangeBalance,
    };
