import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../utils/app_logger.dart';

class ResponseInterceptor extends Interceptor {
  final AppLogger _appLogger = getx.Get.find<AppLogger>();

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
    final data = response.data;
    if (data != null) {
      if (data is Map) {
        buffer.write('| - Data：  ${response.data.toString()}\n');
        String dataJson = jsonEncode(response.data);
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
    return handler.next(response);
  }
}
