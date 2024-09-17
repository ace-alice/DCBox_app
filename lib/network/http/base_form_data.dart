import 'dart:convert';

import 'package:get/get.dart';

import '../../core/device_manager/index.dart';
import '../../core/lang_manager/index.dart';
import '../../core/user_manager/state.dart';
import 'base_res_data.dart';

class BaseFormData<T extends BaseResData> {
  final DeviceManager _deviceManager;
  final LangManager _langManager;

  final UserState _userState = Get.put(UserState());

  BaseFormData(this._deviceManager, this._langManager);

  Future<String> getFormData(T data) async {
    Map<String, dynamic> dataMap = data.toMap();
    dataMap['s0'] = dataMap['s0'] ?? _userState.token.value;
    dataMap['deviceName'] = await _deviceManager.getDeviceNme;
    dataMap['terminalType'] = _deviceManager.deviceType;
    dataMap['language'] = _langManager.lang;
    return json.encode(dataMap);
  }
}
