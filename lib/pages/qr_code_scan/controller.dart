import 'package:get/get.dart';

import 'state.dart';

class QRCodeScanController extends GetxController {
  final QRCodeScanState state = QRCodeScanState();

  static const kOnScanCallback = 'kOnScanCallback';
  void Function(String text)? onScanCallback;

  QRCodeScanController() {
    onScanCallback = Get.arguments?[QRCodeScanController.kOnScanCallback];
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
