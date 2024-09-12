import 'package:dc_box_app/common/app_logger.dart';
import 'package:dc_box_app/core/user_manager/state.dart';
import 'package:get/get.dart';

import 'user_manager.dart';

class UserManagerImpl implements UserManager {
  UserState userState = Get.put(UserState());

  @override
  Future init() async {
    logger.w('UserManager.init');
    if (userState.loading.value) {
      return;
    }
    userState.loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    userState.loading.value = false;
  }
}
