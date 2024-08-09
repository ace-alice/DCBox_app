import 'package:dc_box_app/common/encrypt/encrypt_manager.dart';
import 'package:dc_box_app/common/encrypt/setup_encrypt.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetupEncrypt(GetStorage()));
    Get.lazyPut(() => EncryptManager(
          getStorage: GetStorage(),
          setupEncrypt: Get.find(),
        ));
    Get.lazyPut(() => WelcomeController(
          setupEncrypt: Get.find(),
          encryptManager: Get.find(),
        ));
  }
}
