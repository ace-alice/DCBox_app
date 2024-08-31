import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../common/app_logger.dart';
import '../../../common/env_config.dart';
import '../../../core/encrypt_manager/encrypt_utils.dart';

class ResponseInterceptor extends Interceptor {
  final bool isNotAes;

  ResponseInterceptor({
    required this.isNotAes,
  });

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

    if (EnvConfig.encryptSwitch && isNotAes) {
      data = EncryptUtils.decrypt(responseBody: response.data, isShowLog: true);
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
    logger.d(buffer);
    response.data = data;
    return handler.next(response);
  }
}
