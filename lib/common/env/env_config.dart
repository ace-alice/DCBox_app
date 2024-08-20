import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../common/utils/app_logger.dart';
import './env_interface.dart';

class EnvConfig implements EnvInterface {
  final AppLogger _appLogger;

  EnvConfig({required AppLogger appLogger}) : _appLogger = appLogger;

  @override
  // TODO: implement envData
  Map<EnvParams, dynamic> envData = {
    EnvParams.baseApiUrl: 'http://public-capital-elephbit-api-fat.k8s-fat.com',
    EnvParams.merchantUrl: 'http://nat.mob.com',
    EnvParams.encryptSwitch: true,
  };

  @override
  // TODO: implement envType
  EnvType envType = EnvType.prod;

  @override
  Future onInit() async {
    // TODO: implement onInit
    const envTypeStr = String.fromEnvironment('ENV_TYPE');

    if (envTypeStr == EnvType.fat.name) {
      envType = EnvType.fat;
    }
    switch (envType) {
      case EnvType.fat:
        // TODO: Handle this case.
        await dotenv.load(fileName: '.env.fat');
      case EnvType.prod:
        // TODO: Handle this case.
        await dotenv.load(fileName: '.env.prod');
    }
    setEnvData();
  }

  @override
  Future setEnvData() async {
    // TODO: implement setEnvData
    envData[EnvParams.baseApiUrl] = dotenv.get(EnvQuery.BASE_API_URL.name,
        fallback: envData[EnvParams.baseApiUrl]);
    envData[EnvParams.merchantUrl] = dotenv.get(EnvQuery.MERCHANT_URL.name,
        fallback: envData[EnvParams.merchantUrl]);
    envData[EnvParams.encryptSwitch] = bool.parse(dotenv.get(
        EnvQuery.ENCRYPT_SWITCH.name,
        fallback: envData[EnvParams.encryptSwitch].toString()));
    _appLogger.warn('当前环境 ${envType.name}; 当前环境值 ${envData.toString()}');
  }

  String get getBaseApiUrl => envData[EnvParams.baseApiUrl];

  String get getMerchantUrl => envData[EnvParams.merchantUrl];

  bool get encryptSwitch => bool.parse(envData[EnvParams.encryptSwitch]);

  @override
  getEnvDataByParam(EnvParams envParam) {
    // TODO: implement getEnvDataByParam
    return envData[envParam];
  }
}
