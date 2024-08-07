import 'package:dc_box_app/common/router/app_routes.dart';
import 'package:get/get.dart';

import 'state.dart';

class WelcomeController extends GetxController {
  final WelcomeState state = WelcomeState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.app);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
