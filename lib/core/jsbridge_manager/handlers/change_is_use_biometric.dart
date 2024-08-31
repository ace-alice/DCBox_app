import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/app_logger.dart';
import '../../../common/storage_key.dart';
import '../../biometric_manager/biometric_manager.dart';
import '../../env_manager/state.dart';
import '../core/jsbridge.dart';

Future<Object?> changeIsUseBiometric(Object? data) async {
  logger.d('changeIsUseBiometric: $data');
  EnvState envState = Get.find<EnvState>();
  final invokeResult = await BiometricManager.invokeBiometricAuth();
  var setResult = false;
  if (invokeResult) {
    setResult = bool.parse(data as String);
    envState.isUseBiometric.value = setResult;
    GetStorage getStorage = GetStorage();
    getStorage.write(StorageKey.isUseBiometric, data);
    jsBridge.callHandler('changeIsUseBiometric', data: setResult);
  }
  return setResult;
}
