import 'package:dc_box_app/common/env/env_config.dart';
import 'package:dc_box_app/common/utils/app_logger.dart';
import 'package:get/get.dart';

class Global {
  Future init() async {
    Get.put(AppLogger());
    EnvConfig envConfig = Get.put(EnvConfig());
    await envConfig.onInit();
  }
}
