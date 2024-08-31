import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/env_config.dart';
import '../../common/storage_key.dart';

class EnvState {
  final envType = EnvConfig.envType;

  final encryptSwitch = EnvConfig.encryptSwitch;

  String apiDomain = '';
  final webDomain = ''.obs;

  final isNetworking = true.obs;

  final isUseBiometric = false.obs;

  EnvState() {
    ///Initialize variables
    GetStorage getStorage = GetStorage();
    String? result = getStorage.read(StorageKey.isUseBiometric);
    isUseBiometric.value = result != null ? bool.parse(result) : false;
  }
}
