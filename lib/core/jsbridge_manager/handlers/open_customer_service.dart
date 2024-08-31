import 'package:get/get.dart';

import '../../../pages/qia_qia_service/controller.dart';
import '../../../router/app_routes.dart';

Future<Object?> openCustomerService(Object? data) async {
  Future.delayed(const Duration(milliseconds: 300), () async {
    if (data is String) {
      Get.toNamed(AppRoutes.service, arguments: {
        QiaQiaServiceController.serviceUrlKey: data.toString(),
      });
    }
  });
  return null;
}
