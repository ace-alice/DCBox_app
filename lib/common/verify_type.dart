enum VerifyType {
  none,
  phone,
  email,
  otp,
  payPass,
  bio,
  sms,
}

class VerifyTypeConfig {
  static int getIndexByType(VerifyType type) {
    return type.index;
  }

  static VerifyType getTypeByIndex(int index) {
    return VerifyType.values.firstWhere((VerifyType type) {
      return type.index == index;
    });
  }
}
