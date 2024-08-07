import 'package:get/get.dart';

import 'controller.dart';

class TradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TradeController());
  }
}
