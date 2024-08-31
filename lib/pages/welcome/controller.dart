import 'package:get/get.dart';

import '../../core/env_manager/env_manager.dart';
import '../../core/permission_manager/permission_manager.dart';
import '../../router/app_routes.dart';
import 'state.dart';

class WelcomeController extends GetxController {
  final EnvManager _envManager;
  final PermissionManager _permissionManager;

  WelcomeController(
      {required EnvManager envManager,
      required PermissionManager permissionManager})
      : _envManager = envManager,
        _permissionManager = permissionManager;

  final WelcomeState state = WelcomeState();

  Future getWebDomain() async {
    bool status = await _envManager.init();
    if (status) {
      state.loadingStatus.value = LoadStatus.success;
    } else {
      state.loadingStatus.value = LoadStatus.fail;
    }
  }

  @override
  void onReady() {
    super.onReady();
    ever(state.loadingStatus, (value) {
      if (value == LoadStatus.success) {
        Get.toNamed(AppRoutes.browser);
      }
    });
    getWebDomain();
  }
}
