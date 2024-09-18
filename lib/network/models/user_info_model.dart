import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  @JsonKey(defaultValue: '')
  final String loginName;
  @JsonKey(defaultValue: '')
  final String nickName;
  @JsonKey(defaultValue: '')
  final String countryCode;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String email;
  final dynamic headUrl;
  @JsonKey(defaultValue: 0)
  final int userType;
  final dynamic kycStatus;
  @JsonKey(defaultValue: 0)
  final int kycLevel;
  final dynamic kycApplyStatus;
  final dynamic authJunior;
  final dynamic authJuniorKycApproveRemark;
  final dynamic juniorKycRemark;
  final dynamic authHigher;
  final dynamic authHigherKycApproveRemark;
  final dynamic higherKycRemark;
  @JsonKey(defaultValue: 0)
  final int securityLevel;
  final dynamic totalOrderNum;
  final dynamic successOrderNum;
  @JsonKey(defaultValue: false)
  final bool hasTranPass;
  @JsonKey(defaultValue: false)
  final bool pwdExpired;
  @JsonKey(defaultValue: false)
  final bool transPwdExpired;
  @JsonKey(defaultValue: 0)
  final int tranPassFailTimes;
  @JsonKey(defaultValue: false)
  final bool boundOtp;
  @JsonKey(defaultValue: false)
  final bool boundBankCard;
  @JsonKey(defaultValue: false)
  final bool verifyPhone;
  @JsonKey(defaultValue: false)
  final bool verifyEmail;
  @JsonKey(defaultValue: false)
  final bool verifyOtp;
  @JsonKey(defaultValue: false)
  final bool addressWhitelist;
  @JsonKey(defaultValue: false)
  final bool doneWithdraw;
  @JsonKey(defaultValue: false)
  final bool biometrics;
  @JsonKey(defaultValue: false)
  final bool screenshotProtection;
  @JsonKey(defaultValue: false)
  final bool replySms;
  final dynamic antiPhishingCode;
  @JsonKey(defaultValue: 0)
  final int userFlag;
  final dynamic userFlagInvalidStart;
  final dynamic userFlagInvalidEnd;
  @JsonKey(defaultValue: 0)
  final int rechargeFlag;
  final dynamic rechargeFlagInvalidStart;
  final dynamic rechargeFlagInvalidEnd;
  @JsonKey(defaultValue: 0)
  final int withdrawFlag;
  final dynamic withdrawFlagInvalidStart;
  final dynamic withdrawFlagInvalidEnd;
  @JsonKey(defaultValue: 0)
  final int transferFlag;
  @JsonKey(defaultValue: 0)
  final int sellFlag;
  final dynamic transferFlagInvalidStart;
  final dynamic transferFlagInvalidEnd;
  @JsonKey(defaultValue: false)
  final bool dcboxFirstLogin;
  @JsonKey(defaultValue: false)
  final bool kycAllLimitSwitchOn;
  @JsonKey(defaultValue: false)
  final bool otcBuySwitchOn;
  @JsonKey(defaultValue: false)
  final bool otcSwitchOn;
  @JsonKey(defaultValue: false)
  final bool creditSwitchOn;
  @JsonKey(defaultValue: false)
  final bool isTranPassAudit;
  @JsonKey(defaultValue: 0)
  final int isKycBank;
  @JsonKey(defaultValue: '')
  final String kycRealName;
  @JsonKey(defaultValue: '')
  final String idNo;
  @JsonKey(defaultValue: false)
  final bool migrateFlag;
  @JsonKey(defaultValue: 0)
  final int systemTime;
  @JsonKey(defaultValue: false)
  final bool hasCreditCard;
  @JsonKey(defaultValue: '')
  final String language;
  final dynamic isSpecialSupplier;
  final dynamic invitationCode;
  @JsonKey(defaultValue: false)
  final bool whetherBindSuperior;
  @JsonKey(defaultValue: false)
  final bool whetherFirstLogin;
  @JsonKey(defaultValue: 0)
  final int kycBuyStatus;
  @JsonKey(defaultValue: '')
  final String token;

  const UserInfoModel({
    required this.loginName,
    required this.nickName,
    required this.countryCode,
    required this.phone,
    required this.email,
    this.headUrl,
    required this.userType,
    this.kycStatus,
    required this.kycLevel,
    this.kycApplyStatus,
    this.authJunior,
    this.authJuniorKycApproveRemark,
    this.juniorKycRemark,
    this.authHigher,
    this.authHigherKycApproveRemark,
    this.higherKycRemark,
    required this.securityLevel,
    this.totalOrderNum,
    this.successOrderNum,
    required this.hasTranPass,
    required this.pwdExpired,
    required this.transPwdExpired,
    required this.tranPassFailTimes,
    required this.boundOtp,
    required this.boundBankCard,
    required this.verifyPhone,
    required this.verifyEmail,
    required this.verifyOtp,
    required this.addressWhitelist,
    required this.doneWithdraw,
    required this.biometrics,
    required this.screenshotProtection,
    required this.replySms,
    this.antiPhishingCode,
    required this.userFlag,
    this.userFlagInvalidStart,
    this.userFlagInvalidEnd,
    required this.rechargeFlag,
    this.rechargeFlagInvalidStart,
    this.rechargeFlagInvalidEnd,
    required this.withdrawFlag,
    this.withdrawFlagInvalidStart,
    this.withdrawFlagInvalidEnd,
    required this.transferFlag,
    required this.sellFlag,
    this.transferFlagInvalidStart,
    this.transferFlagInvalidEnd,
    required this.dcboxFirstLogin,
    required this.kycAllLimitSwitchOn,
    required this.otcBuySwitchOn,
    required this.otcSwitchOn,
    required this.creditSwitchOn,
    required this.isTranPassAudit,
    required this.isKycBank,
    required this.kycRealName,
    required this.idNo,
    required this.migrateFlag,
    required this.systemTime,
    required this.hasCreditCard,
    required this.language,
    this.isSpecialSupplier,
    this.invitationCode,
    required this.whetherBindSuperior,
    required this.whetherFirstLogin,
    required this.kycBuyStatus,
    required this.token,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
