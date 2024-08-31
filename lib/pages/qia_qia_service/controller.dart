import 'package:get/get.dart';

import 'state.dart';

class QiaQiaServiceController extends GetxController {
  final QiaQiaServiceState state = QiaQiaServiceState();

  static const serviceUrlKey = 'serviceUrlKey';

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.serviceUrl.value = Get.arguments[serviceUrlKey];
    }
    super.onInit();
  }
}
