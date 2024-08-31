import 'package:get_storage/get_storage.dart';

import '../common/app_logger.dart';
import '../common/storage_key.dart';

/// 判断AseKey是否存在或者过期
bool get hasExpired {
  String? serviceAesKey = getAesKeyFormStorage;
  DateTime? lastTime = getLastTimeFormStorage;
  if (serviceAesKey == null || !serviceAesKey.isNotEmpty) {
    return true;
  }
  if (lastTime == null) {
    return true;
  }
  DateTime nowTime = DateTime.now();
  int days = nowTime.difference(lastTime).inDays;
  logger.d('days > 30  ${days > 30}');
  return days > 30;
}

/// 从内存中获取AesKey
String? get getAesKeyFormStorage {
  GetStorage getStorage = GetStorage();
  String? serviceAesKey = getStorage.read(StorageKey.serviceAesKey);
  return serviceAesKey;
}

/// 从内存中获取AesKey最后生成时间
DateTime? get getLastTimeFormStorage {
  GetStorage getStorage = GetStorage();
  String? lastTime = getStorage.read(StorageKey.lastAesTime);
  if (lastTime != null) {
    return DateTime.parse(lastTime);
  } else {
    return null;
  }
}

/// 将AesKey保存在内存中
Future setAesKeyToStorage(String aesKey) async {
  GetStorage getStorage = GetStorage();
  await getStorage.write(StorageKey.serviceAesKey, aesKey);
}

/// 将AesKey最后生成时间保存在内存中
Future setLastTimeToStorage(DateTime dateTime) async {
  GetStorage getStorage = GetStorage();
  await getStorage.write(StorageKey.lastAesTime, dateTime.toIso8601String());
}
