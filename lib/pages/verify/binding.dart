import 'package:dc_box_app/network/api/send_verify_code.dart';
import 'package:get/get.dart';

import '../../core/device_manager/index.dart';
import '../../core/env_manager/state.dart';
import '../../core/lang_manager/index.dart';
import 'controller.dart';

class VerifyBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<LangManager>(() => LangManagerImpl()),
      Bind.lazyPut<DeviceManager>(() => DeviceManagerImpl()),
      Bind.lazyPut<SendVerifyCodeHttp>(
        () => SendVerifyCodeHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut(() => VerifyController(sendVerifyCodeHttp: Bind.find())),
    ];
  }
}
