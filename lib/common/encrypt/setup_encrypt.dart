import 'dart:ui';

import 'package:dc_box_app/common/utils/storage_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_logger.dart';

class SetupEncrypt {
  final GetStorage _storage;

  final AppLogger _appLogger = Get.find<AppLogger>();

  SetupEncrypt(GetStorage getStorage) : _storage = getStorage;

  VoidCallback listenAesKey(void Function(String?) callBack) {
    return _storage.listenKey(StorageKey.serviceAesKey, (value) {
      if (value == null) {
        onInit();
      }
      callBack.call(value);
    });
  }

  bool hasExpired() {
    String? serviceAesKey = _storage.read(StorageKey.serviceAesKey);
    String? lastTime = _storage.read(StorageKey.lastAesTime);
    _appLogger.warn('serviceAesKey  $serviceAesKey');
    _appLogger.warn('lastTime  $lastTime');
    if (serviceAesKey == null || !serviceAesKey.isNotEmpty) {
      return true;
    }
    if (lastTime == null) {
      return true;
    }
    DateTime nowTime = DateTime.now();
    int days = nowTime.difference(DateTime.parse(lastTime)).inDays;
    _appLogger.warn('days > 30  ${days > 30}');
    return days > 30;
  }

  Future<bool> onInit() async {
    if (hasExpired()) {
      _appLogger.warn('start  ${DateTime.now().toIso8601String()}');
      await Future.delayed(const Duration(seconds: 10));
      _appLogger.warn('end  ${DateTime.now().toIso8601String()}');
      await _storage.write(StorageKey.serviceAesKey, 'serviceAesKey');
      await _storage.write(
          StorageKey.lastAesTime, DateTime.now().toIso8601String());
      _appLogger.warn(StorageKey.serviceAesKey);
    }
    return true;
  }
}
