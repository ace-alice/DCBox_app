///环境配置
class EnvConfig {
  static const EnvType envType = EnvType.fat;

  static bool get encryptSwitch {
    switch (envType) {
      case EnvType.fat:
        return false;
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
          'http://public-capital-lucky-gateway-fat.k8s-fat.com/',
        ];
      case EnvType.uat:
        return [
          'https://uatproxy.capluckywlt.com/',
          'https://uatproxy.caplw.com/',
        ];
      case EnvType.stg:
        return [
          'https://stg-proxy.capluckywlt.com/',
          'https://stg-proxy.caplw.com/',
        ];
      case EnvType.prod:
        return [
          'https://proxy.capluckywlt.com/',
          'https://proxy.caplw.com/',
          'https://34.92.108.46:8498/',
        ];
    }
  }
}

enum EnvType {
  fat,
  uat,
  stg,
  prod,
}
