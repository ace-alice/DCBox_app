import 'package:dc_box_app/network/api/get_verify_types.dart';
import 'package:get/get.dart';

import '../../core/device_manager/index.dart';
import '../../core/env_manager/state.dart';
import '../../core/lang_manager/index.dart';
import '../../network/api/generate_slider.dart';
import '../../network/api/pre_login.dart';
import '../../network/api/verify_slider.dart';
import 'controller.dart';

class LoginBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<LangManager>(() => LangManagerImpl()),
      Bind.lazyPut<DeviceManager>(() => DeviceManagerImpl()),
      Bind.lazyPut<PreLoginHttp>(
        () => PreLoginHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<GenerateSliderHttp>(
        () => GenerateSliderHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<VerifySliderHttp>(
        () => VerifySliderHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<GetVerifyTypesHttp>(
        () => GetVerifyTypesHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut(() => LoginController(
          preLoginHttp: Bind.find(), getVerifyTypesHttp: Bind.find()))
    ];
  }
}
