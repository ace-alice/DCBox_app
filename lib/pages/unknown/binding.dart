import 'package:get/get.dart';

import 'controller.dart';

class UnknownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnknownController());
  }
}
