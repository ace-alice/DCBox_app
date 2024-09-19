import 'package:json_annotation/json_annotation.dart';

part 'user_balance_model.g.dart';

@JsonSerializable()
class UserBalanceModel {
  @JsonKey(defaultValue: [])
  final List<BalanceList> balanceList;
  @JsonKey(defaultValue: 0)
  final double balanceByUSDT;
  @JsonKey(defaultValue: 0)
  final double balanceByCNY;

  const UserBalanceModel({
    required this.balanceList,
    required this.balanceByUSDT,
    required this.balanceByCNY,
  });

  factory UserBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceModelToJson(this);
}

@JsonSerializable()
class BalanceList {
  @JsonKey(defaultValue: '')
  final String currency;
  @JsonKey(defaultValue: 0)
  final double balance;
  @JsonKey(defaultValue: 0)
  final double exchangeRate;
  @JsonKey(defaultValue: '')
  final String exchangeCurrency;
  @JsonKey(defaultValue: 0)
  final double exchangeBalance;

  const BalanceList({
    required this.currency,
    required this.balance,
    required this.exchangeRate,
    required this.exchangeCurrency,
    required this.exchangeBalance,
  });

  factory BalanceList.fromJson(Map<String, dynamic> json) =>
      _$BalanceListFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceListToJson(this);
}
