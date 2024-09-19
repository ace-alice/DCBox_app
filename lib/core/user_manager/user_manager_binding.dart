import 'package:dc_box_app/core/user_manager/index.dart';
import 'package:dc_box_app/network/api/get_user_balance.dart';
import 'package:dc_box_app/network/api/get_user_info.dart';
import 'package:get/get.dart';

import '../device_manager/index.dart';
import '../env_manager/state.dart';
import '../lang_manager/index.dart';

class UserManagerBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<LangManager>(() => LangManagerImpl()),
      Bind.lazyPut<DeviceManager>(() => DeviceManagerImpl()),
      Bind.lazyPut<GetUserInfoHttp>(
        () => GetUserInfoHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<GetUserBalanceHttp>(
        () => GetUserBalanceHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find(),
        ),
      ),
      Bind.lazyPut<UserManager>(
        () => UserManagerImpl(
          getUserInfoHttp: Bind.find(),
          getUserBalanceHttp: Bind.find(),
        ),
      ),
    ];
  }
}
