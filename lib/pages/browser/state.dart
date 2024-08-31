import 'package:get/get.dart';

import '../../widgets/custom_web/controller.dart';

class BrowserState {
  CustomWebController? webViewController;

  RxBool isInit = false.obs;

  BrowserState() {
    ///Initialize variables
  }
}
