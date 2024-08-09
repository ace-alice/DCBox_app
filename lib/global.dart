import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './common/env/env_config.dart';
import './common/utils/app_logger.dart';

class Global {
  Future init() async {
    await GetStorage.init();
    Get.put(AppLogger());
    EnvConfig envConfig = Get.put(EnvConfig(
      appLogger: Get.find(),
    ));
    await envConfig.onInit();
  }
}
