import 'package:get/get.dart';

import '../../core/currency_list_manager/index.dart';
import '../../core/device_manager/controller.dart';
import '../../core/device_manager/device_manager.dart';
import '../../core/encrypt_manager/index.dart';
import '../../core/env_manager/index.dart';
import '../../core/env_manager/state.dart';
import '../../core/lang_manager/index.dart';
import '../../core/permission_manager/controller.dart';
import '../../core/permission_manager/permission_manager.dart';
import '../../core/summary_trans_manager/index.dart';
import '../../network/api/get_aes_private_key.dart';
import '../../network/api/get_currency_list.dart';
import '../../network/api/get_rsa_public_key.dart';
import '../../network/api/summary_trans.dart';
import 'controller.dart';

class WelcomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EnvState>(() => EnvState()),
      Bind.lazyPut<PermissionManager>(() => PermissionManagerImpl()),
      Bind.lazyPut<LangManager>(() => LangManagerImpl()),
      Bind.lazyPut<DeviceManager>(() => DeviceManagerImpl()),
      Bind.lazyPut<EncryptManager>(() => EncryptManagerImpl(
          getRsaPublicKey: Get.find(), getAesPrivateKey: Get.find())),
      Bind.lazyPut<EnvManager>(
          () => EnvManagerImpl(encryptManager: Get.find())),
      Bind.lazyPut<GetAesPrivateKey>(() =>
          GetAesPrivateKey(deviceManager: Get.find(), langManager: Get.find())),
      Bind.lazyPut<GetRsaPublicKey>(() =>
          GetRsaPublicKey(deviceManager: Get.find(), langManager: Get.find())),
      Bind.lazyPut<SummaryTransHttp>(() => SummaryTransHttp(
          deviceManager: Get.find(),
          langManager: Get.find(),
          envState: Get.find())),
      Bind.lazyPut<SummaryTransManager>(
          () => SummaryTransManagerImpl(summaryTransHttp: Get.find())),
      Bind.lazyPut<EncryptManager>(() => EncryptManagerImpl(
            getRsaPublicKey: Get.find(),
            getAesPrivateKey: Get.find(),
          )),
      Bind.lazyPut<EnvManager>(
        () => EnvManagerImpl(
          encryptManager: Get.find(),
        ),
      ),
      Bind.lazyPut<GetCurrencyListHttp>(() => GetCurrencyListHttp(
          deviceManager: Bind.find(),
          langManager: Bind.find(),
          envState: Bind.find())),
      Bind.lazyPut<CurrencyListManager>(
          () => CurrencyListManagerImpl(getCurrencyListHttp: Bind.find())),
      Bind.lazyPut(
        () => WelcomeController(
          envManager: Get.find(),
          permissionManager: Get.find(),
          summaryTransManager: Get.find(),
          currencyListManager: Get.find(),
        ),
      )
    ];
  }
}
