import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

import '../../utils/app_logger.dart';

class ErrorInterceptor extends Interceptor {
  final AppLogger _appLogger = getx.Get.find<AppLogger>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //处理错误信息
    handlerError(err);
    StringBuffer buffer = StringBuffer();
    buffer.write('|--- Error (っ °Д °;)っ---\n');
    buffer.write('| \n');
    buffer.write('| - ExceptionType：${err.type.name}\n');
    buffer.write('| - ErrorMsg：     ${err.message}\n');
    buffer.write('| - StatusCode：   ${err.response?.statusCode}\n');
    buffer.write('| - StatusMsg：    ${err.response?.statusMessage}\n');
    _appLogger.error(buffer);
    return handler.next(err);
  }

  ///处理错误信息 --自行去实现里面的功能代码
  void handlerError(DioException err) {
    switch (err.type) {
      //连接超时
      case DioExceptionType.connectionTimeout:
        break;
      //响应超时
      case DioExceptionType.receiveTimeout:
        break;
      //发送超时
      case DioExceptionType.sendTimeout:
        break;
      //请求取消
      case DioExceptionType.cancel:
        break;
      //错误响应 404 等
      case DioExceptionType.badResponse:
        break;
      //错误证书
      case DioExceptionType.badCertificate:
        break;
      //未知错误
      default:
        break;
    }
  }

  void printDebugLog(StringBuffer buffer) {
    if (kDebugMode) {
      _appLogger.error(buffer.toString());
    }
  }
}
