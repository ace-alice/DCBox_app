import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';
import '../device_manager/controller.dart';
import '../device_manager/device_manager.dart';
import '../env_manager/state.dart';
import '../lang_manager/index.dart';
import 'controller.dart';
import 'country_manager.dart';
import 'state.dart';

class CountryManagerBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<DeviceManager>(() => DeviceManagerImpl()),
      Bind.lazyPut<LangManager>(() => LangManagerImpl()),
      Bind.lazyPut<GetCountryListHttp>(() => GetCountryListHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find())),
      Bind.lazyPut<CountryManager>(() => CountryManagerImpl(
          getCountryListHttp: Bind.find(), langManager: Bind.find())),
      Bind.lazyPut<CountryState>(() => CountryState()),
    ];
  }
}
