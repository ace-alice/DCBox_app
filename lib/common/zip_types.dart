enum ZipType {
  /// 登录
  LOGIN,

  /// 修改登录密码
  CHANGE_LOGIN_PASSWORD,

  /// 修改交易密码
  CHANGE_TRANS_PASSWORD,

  /// 忘记登录密码
  FORGET_LOGIN_PASSWORD,

  /// 忘记交易密码
  FORGET_TRANS_PASSWORD,

  /// 添加手机号
  ADD_PHONE,

  /// 修改手机号
  CHANGE_PHONE,

  /// 开启手机验证
  PHONE_VERIFY_ON,

  /// 关闭手机验证
  PHONE_VERIFY_OFF,

  /// 添加邮箱
  ADD_EMAIL,

  /// 修改邮箱
  CHANGE_EMAIL,

  /// 开启邮箱验证
  EMAIL_VERIFY_ON,

  /// 关闭邮箱验证
  EMAIL_VERIFY_OFF,

  /// 开启OTP验证/绑定OTP
  OTP_VERIFY_ON,

  /// 关闭OTP验证
  OTP_VERIFY_OFF,

  /// 提币
  WITHDRAWAL,

  /// 转账
  TRANSFER,

  /// 增加白名单
  ADDRESS_WHITELIST_ADD,

  /// 提币白名单开启
  ADDRESS_WHITELIST_ON,

  /// 提币白名单关闭
  ADDRESS_WHITELIST_OFF,

  /// 设置防钓鱼码
  SET_ANTI_FISHING_CODE,

  /// 网站扫码支付(上分)
  WEB_QRCODE_PAY,

  /// 开启短信回复验证
  REPLY_SMS_ON,

  /// 关闭短信回复验证
  REPLY_SMS_OFF,

  /// 安全验证 - 针对人机验证
  SECURITY_CHECK,

  /// 注册 - 针对人机验证
  REGISTRATION,

  /// 忘记交易密码时，验证登录密码
  CHECK_LOGIN_PASSWORD,

  /// KYC认证
  KYC_APPLY,

  ///OTC卖币
  OTC_SELL_COIN,

  ///添加银行卡
  ADD_BANK_ACCOUNT,

  ///删除银行卡
  DELETE_BANK_ACCOUNT,

  ///信用卡开卡
  APPLY_CREDIT_CARD,

  ///查看信用卡CVV
  GET_CREDIT_CARD_CVV,

  /// 信用卡充值
  CREDITCARD_DEPOSIT,

  /// 信用卡挂失
  CREDITCARD_LOST,

  /// 信用卡解挂
  CREDITCARD_UNLOST,
}
