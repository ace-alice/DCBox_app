import 'package:dc_box_app/common/encrypt/setup_encrypt.dart';
import 'package:dc_box_app/common/router/app_routes.dart';
import 'package:get/get.dart';

import '../../common/utils/app_logger.dart';
import 'state.dart';

class WelcomeController extends GetxController {
  final WelcomeState state = WelcomeState();

  final SetupEncrypt _setupEncrypt;

  final AppLogger _appLogger = Get.find<AppLogger>();

  WelcomeController({
    required SetupEncrypt setupEncrypt,
  }) : _setupEncrypt = setupEncrypt;

  @override
  onInit() {
    // TODO: implement onReady
    super.onInit();
    _setupEncrypt.onInit().then((isFinish) {
      if (isFinish) {
        _appLogger.warn('isFinish  ${DateTime.now().toIso8601String()}');
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
