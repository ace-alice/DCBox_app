///环境配置
class EnvConfig {
  static const EnvType envType = EnvType.prod;

  static bool get encryptSwitch {
    switch (envType) {
      case EnvType.fat:
        return true;
      case EnvType.uat:
      case EnvType.stg:
      case EnvType.prod:
        return true;
    }
  }

  static List<String> get apiDomains {
    switch (envType) {
      case EnvType.fat:
        return [
          'http://public-capital-elephbit-proxy-fat.k8s-fat.com/',
        ];
      case EnvType.uat:
        return [
          'https://uatproxy.capeleph.com/',
        ];
      case EnvType.stg:
        return [
          'https://stg-proxy.capeleph.com/',
          'https://stg-proxy.elephbit.com/',
        ];
      case EnvType.prod:
        return [
          'https://35.215.148.46:55502/',
          'https://proxy.capeleph.com/',
          'https://proxy.elephbit.com/',
        ];
    }
  }

  /// token过期时间 以分钟为单位
  static int tokenExpiredMarket = 30;
}

enum EnvType {
  fat,
  uat,
  stg,
  prod,
}
