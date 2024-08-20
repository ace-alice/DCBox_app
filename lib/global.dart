import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './common/core/device_manager/device_manager_impl.dart';
import './common/env/env_config.dart';
import './common/utils/app_logger.dart';
import 'common/core/lang_manager/lang_manager.dart';
import 'common/core/lang_manager/lang_manager_impl.dart';

class Global {
  Future init() async {
    await GetStorage.init();
    Get.lazyPut(() => DeviceManagerImpl());
    LangManager langManager = Get.put(LangManagerImpl());
    Get.put(AppLogger());
    EnvConfig envConfig = Get.put(EnvConfig(
      appLogger: Get.find(),
    ));
    langManager.onInit();
    await envConfig.onInit();
  }
}
