import 'dart:convert';

import 'package:dc_box_app/common/core/device_manager/device_manager.dart';
import 'package:dc_box_app/common/core/device_manager/device_manager_impl.dart';
import 'package:dc_box_app/common/core/lang_manager/lang_manager.dart';
import 'package:dc_box_app/common/core/lang_manager/lang_manager_impl.dart';
import 'package:dc_box_app/common/http/base_res_data.dart';
import 'package:get/get.dart' as getx;

class BaseFormData<T extends BaseResData> {
  final DeviceManager _deviceManager = getx.Get.find<DeviceManagerImpl>();
  final LangManager _langManager = getx.Get.find<LangManagerImpl>();

  Future<String> getFormData(T data) async {
    Map<String, dynamic> dataMap = data.toMap();
    dataMap['s0'] = '';
    dataMap['deviceName'] = await _deviceManager.getDeviceNme;
    dataMap['terminalType'] = _deviceManager.deviceType;
    dataMap['language'] = _langManager.lang;
    return json.encode(dataMap);
  }
}
