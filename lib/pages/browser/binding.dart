import 'package:get/get.dart';

import '../../core/env_manager/state.dart';
import '../../core/jsbridge_manager/index.dart';
import 'controller.dart';

class BrowserBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<JsbridgeManager>(() => JsbridgeManagerImpl()),
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<BrowserController>(
        () => BrowserController(jsbridgeManager: Get.find()),
      )
    ];
  }
}
