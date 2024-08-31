import 'package:get/get.dart';

import '../../../pages/browser/controller.dart';
import '../../../pages/qr_code_scan/controller.dart';
import '../../../router/app_routes.dart';
import '../core/jsbridge.dart';

Future<Object?> toQRCodeScanner(Object? data) async {
  Future.delayed(const Duration(milliseconds: 300), () async {
    // await Get.find<PermissionManager>().request(SupportPermissionType.camera);
    Get.toNamed(AppRoutes.scan, arguments: {
      QRCodeScanController.kOnScanCallback: onScan,
    });
  });
  return null;
}

void onScan(String text) {
  ///这里可以跳转到转账记录页面
  BrowserController browserController = Get.find<BrowserController>();
  if (text.contains('/transfer?ads=')) {
    final path = text.split('/transfer')[1];
    // DialogUtils.showLoading();

    ///需要处理以下domain
    browserController.onReload('transfer$path');
    Get.back();
  }
  jsBridge.callHandler('QRCodeCallback', data: text);
  return;
}
