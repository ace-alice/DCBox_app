import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:uuid/uuid.dart';

import '../../common/storage_key.dart';
import 'device_manager.dart';

class DeviceManagerImpl implements DeviceManager {
  final GetStorage _storage = GetStorage();

  @override
  Future<String> get deviceId async {
    var id = _storage.read<String>(StorageKey.deviceId);
    if (id != null) {
      return id;
    }
    var tempId = await PlatformDeviceId.getDeviceId;
    tempId ??= deviceType + const Uuid().v4();
    _storage.write(StorageKey.deviceId, tempId);
    return tempId;
  }

  @override
  String get deviceType => Platform.isIOS
      ? 'IOS'
      : Platform.isAndroid
          ? 'ANDROID'
          : 'H5';

  @override
  Future<String> get releaseType async {
    return Platform.isAndroid
        ? _releaseTypeApk
        : (await isWrapper)
            ? _releaseTypeWrapper
            : _releaseTypeEnterprise;
  }

  Future<bool> get isWrapper async {
    final packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    return packageName == _smallToast || packageName == _planAndDone;
  }

  @override
  Future<String> get getDeviceNme async {
    final deviceInfo = DeviceInfoPlugin();
    return Platform.isIOS
        ? (await deviceInfo.iosInfo).utsname.sysname
        : Platform.isAndroid
            ? (await deviceInfo.androidInfo).model
            : kIsWeb
                ? (await deviceInfo.webBrowserInfo).userAgent ??
                    'TrKey.unknown.tr'
                : (await deviceInfo.deviceInfo).data.toString();
  }

  @override
  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // 获取版本号
    String version = packageInfo.version;
    return version;
  }
}

const _releaseTypeApk = 'apk';
const _releaseTypeWrapper = 'wrapper';
const _releaseTypeEnterprise = 'enterprise';

const _smallToast = 'com.zjst.SmallToast';
const _planAndDone = 'com.app.PlanAndDone';
