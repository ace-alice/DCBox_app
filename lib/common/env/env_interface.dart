abstract class EnvInterface {
  late final EnvType envType;

  late final Map<EnvParams, dynamic> envData;

  Future onInit();

  Future setEnvData();

  dynamic getEnvDataByParam(EnvParams envParam);
}

enum EnvType {
  fat,
  prod,
}

enum EnvParams {
  baseApiUrl,
  merchantUrl,
}

enum EnvQuery {
  BASE_API_URL,
  MERCHANT_URL,
}
