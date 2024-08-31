import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/device_manager/index.dart';
import 'core/lang_manager/index.dart';

class Global {
  Future init() async {
    await GetStorage.init();
    Get.lazyPut(() => DeviceManagerImpl());
    LangManager langManager = Get.put(LangManagerImpl());
    langManager.onInit();
  }
}
