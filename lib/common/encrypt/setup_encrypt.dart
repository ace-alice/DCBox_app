import 'dart:ui';

import 'package:dc_box_app/common/utils/storage_key.dart';
import 'package:get_storage/get_storage.dart';

class SetupEncrypt {
  final GetStorage _storage;

  SetupEncrypt(GetStorage getStorage) : _storage = getStorage;

  VoidCallback listenAesKey(void Function(String) callBack) {
    return _storage.listenKey(StorageKey.serviceAesKey, (value) {
      if (value == null) {
        onInit();
      }
      callBack.call(value);
    });
  }

  bool hasExpired() {
    String? serviceAesKey = _storage.read(StorageKey.serviceAesKey);
    DateTime? lastTime = _storage.read(StorageKey.lastAesTime);
    DateTime nowTime = DateTime.now();
    if (lastTime != null && serviceAesKey != null && serviceAesKey.isNotEmpty) {
      int days = nowTime.difference(lastTime).inDays;
      return days > 30;
    }
    return true;
  }

  Future onInit() async {
    if (!hasExpired()) {}
  }
}
