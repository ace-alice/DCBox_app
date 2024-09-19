import 'dart:convert';

import 'package:get/get.dart';

import '../../core/device_manager/index.dart';
import '../../core/lang_manager/index.dart';
import '../../core/user_manager/state.dart';
import '../../core/user_manager/user_manager.dart';
import 'base_res_data.dart';

class BaseFormData<T extends BaseResData> {
  final DeviceManager _deviceManager;
  final LangManager _langManager;

  final UserState _userState = Get.put(UserState());

  final UserManager _userManager = Get.find<UserManager>();

  BaseFormData(this._deviceManager, this._langManager);

  List<String> whiteList = [
    'gw/p2',
    'gw/p1',
    'common/getCountryCode',
    'exchangeUser/loginAuth',
    'exchangeUser/login',
    'common/sendVerifyCode',
    'exchangePay/summaryTransIn24Hours',
    'security/verifyRequest',
    'common/validateSlider',
    'security/getVerifyTypes',
    'exchangeCurrency/queryCurrencyList',
    'common/generateSlider',
  ];

  Future<String> getFormData(T data, String path) async {
    if (!whiteList.contains(path)) {
      _userManager.checkToken();
    }
    Map<String, dynamic> dataMap = data.toMap();
    dataMap['s0'] = dataMap['s0'] ?? _userState.token.value;
    dataMap['deviceName'] = await _deviceManager.getDeviceNme;
    dataMap['terminalType'] = _deviceManager.deviceType;
    dataMap['language'] = _langManager.lang;
    return json.encode(dataMap);
  }
}
