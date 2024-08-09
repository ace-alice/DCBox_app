import 'package:dc_box_app/common/encrypt/encrypt_manager.dart';
import 'package:dc_box_app/common/encrypt/setup_encrypt.dart';
import 'package:dc_box_app/common/router/app_routes.dart';
import 'package:get/get.dart';

import '../../common/utils/app_logger.dart';
import 'state.dart';

class WelcomeController extends GetxController {
  final WelcomeState state = WelcomeState();

  final SetupEncrypt _setupEncrypt;

  final EncryptManager _encryptManager;

  final AppLogger _appLogger = Get.find<AppLogger>();

  WelcomeController({
    required SetupEncrypt setupEncrypt,
    required EncryptManager encryptManager,
  })  : _setupEncrypt = setupEncrypt,
        _encryptManager = encryptManager;

  @override
  onInit() async {
    // TODO: implement onReady
    super.onInit();
    final bool isFinish = await _setupEncrypt.onInit();
    if (isFinish) {
      _encryptManager.onInit();
      Get.toNamed(AppRoutes.app);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
