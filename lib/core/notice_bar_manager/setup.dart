import 'package:dc_box_app/network/api/get_bulletins.dart';
import 'package:get/get.dart';

import '../device_manager/index.dart';
import '../env_manager/state.dart';
import '../lang_manager/index.dart';
import 'controller.dart';
import 'notice_bar_manager.dart';

class NoticeBarManagerBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<LangManager>(() => LangManagerImpl()),
      Bind.lazyPut<DeviceManager>(() => DeviceManagerImpl()),
      Bind.lazyPut<GetBulletinsHttp>(() => GetBulletinsHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find())),
      Bind.lazyPut<NoticeBarManager>(
          () => NoticeBarManagerImpl(getBulletinsHttp: Bind.find())),
    ];
  }
}
