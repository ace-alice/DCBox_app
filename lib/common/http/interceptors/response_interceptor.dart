import 'dart:convert';

import 'package:dc_box_app/common/encrypt/encrypt_manager.dart';
import 'package:dc_box_app/common/env/env_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../utils/app_logger.dart';

class ResponseInterceptor extends Interceptor {
  final AppLogger _appLogger = getx.Get.find<AppLogger>();
  final EncryptManager _encryptManager = getx.Get.find<EncryptManager>();
  final EnvConfig _envConfig = getx.Get.find<EnvConfig>();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    StringBuffer buffer = StringBuffer();
    buffer.write('|--- Response O(∩_∩)O ---\n');
    buffer.write('| \n');
    buffer.write('| - Code：   ${response.statusCode}\n');
    buffer.write('| - CodeMsg：${response.statusMessage}\n');
    buffer.write('| - Header：\n');
    response.headers.forEach((key, value) {
      buffer.write('|    $key  $value\n');
    });
    var data = response.data;

    if (_envConfig.encryptSwitch) {
      data =
          _encryptManager.decrypt(responseBody: response.data, isShowLog: true);
    }
    if (data != null) {
      if (data is Map) {
        buffer.write('| - Data：  ${data.toString()}\n');
        String dataJson = jsonEncode(data);
        buffer.write('| - Json：  $dataJson\n');
      } else if (data is FormData) {
        final formDataMap = {}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        buffer.write("| - Data：  ${formDataMap.toString()}\n");
      } else {
        buffer.write("| - Data：  ${data.toString()}\n");
      }
    }
    _appLogger.warn(buffer);
    return handler.next(data);
  }
}
