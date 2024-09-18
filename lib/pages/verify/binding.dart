import 'package:get/get.dart';

import '../../core/device_manager/index.dart';
import '../../core/env_manager/state.dart';
import '../../core/lang_manager/index.dart';
import '../../network/api/login_auth.dart';
import '../../network/api/send_verify_code.dart';
import '../../network/api/verify_request.dart';
import 'controller.dart';
import 'handlers/index.dart';

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
      Bind.lazyPut<VerifyRequestHttp>(
        () => VerifyRequestHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<LoginAuthHttp>(
        () => LoginAuthHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<LoginHandler>(
          () => LoginHandler(loginAuthHttp: Bind.find())),
      Bind.lazyPut(() => VerifyController(
          sendVerifyCodeHttp: Bind.find(), verifyRequestHttp: Bind.find())),
    ];
  }
}
