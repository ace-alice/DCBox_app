import 'dart:convert';

import '../../core/device_manager/index.dart';
import '../../core/lang_manager/index.dart';
import 'base_res_data.dart';

class BaseFormData<T extends BaseResData> {
  final DeviceManager _deviceManager;
  final LangManager _langManager;

  BaseFormData(this._deviceManager, this._langManager);

  Future<String> getFormData(T data) async {
    Map<String, dynamic> dataMap = data.toMap();
    dataMap['s0'] = '';
    dataMap['deviceName'] = await _deviceManager.getDeviceNme;
    dataMap['terminalType'] = _deviceManager.deviceType;
    dataMap['language'] = _langManager.lang;
    return json.encode(dataMap);
  }
}
