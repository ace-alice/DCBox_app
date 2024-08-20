import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/utils/storage_key.dart';
import '../utils/app_logger.dart';

class SetupEncrypt {
  final GetStorage _storage;

  final AppLogger _appLogger = Get.find<AppLogger>();

  SetupEncrypt(GetStorage getStorage) : _storage = getStorage;

  /// 监听AseKey的变化
  VoidCallback listenAesKey(void Function(String?) callBack) {
    return _storage.listenKey(StorageKey.serviceAesKey, (value) {
      if (value == null) {
        onInit();
      }
      callBack.call(value);
    });
  }

  /// 判断AseKey是否存在或者过期
  bool hasExpired() {
    String? serviceAesKey = _storage.read(StorageKey.serviceAesKey);
    String? lastTime = _storage.read(StorageKey.lastAesTime);
    if (serviceAesKey == null || !serviceAesKey.isNotEmpty) {
      return true;
    }
    if (lastTime == null) {
      return true;
    }
    DateTime nowTime = DateTime.now();
    int days = nowTime.difference(DateTime.parse(lastTime ?? '')).inDays;
    _appLogger.warn('days > 30  ${days > 30}');
    return days > 30;
  }

  /// 获取ase码
  Future initAseKey() async {
    return Future.delayed(const Duration(seconds: 10));
  }

  /// 初始化AseKey
  Future<bool> onInit() async {
    if (hasExpired()) {
      await initAseKey();
      await _storage.write(
          StorageKey.lastAesTime, DateTime.now().toIso8601String());
      await _storage.write(StorageKey.serviceAesKey, 'serviceAesKey');
    }
    return true;
  }
}
