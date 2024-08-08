import 'package:dc_box_app/common/encrypt/setup_encrypt.dart';
import 'package:dc_box_app/common/router/app_routes.dart';
import 'package:get/get.dart';

import 'state.dart';

class WelcomeController extends GetxController {
  final WelcomeState state = WelcomeState();

  final SetupEncrypt _setupEncrypt;

  WelcomeController({
    required SetupEncrypt setupEncrypt,
  }) : _setupEncrypt = setupEncrypt;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _setupEncrypt.onInit().then((bool value) {
      if (value) {
        Get.toNamed(AppRoutes.app);
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
