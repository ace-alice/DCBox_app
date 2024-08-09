import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../../common/utils/app_logger.dart';
import '../../encrypt/encrypt_manager.dart';

class RequestInterceptor extends Interceptor {
  final AppLogger _appLogger = getx.Get.find<AppLogger>();
  final EncryptManager _encryptManager = getx.Get.find<EncryptManager>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    StringBuffer buffer = StringBuffer();
    buffer.write('|---Request ヾ(•ω•`)o\n');
    buffer.write('| \n');
    buffer.write('| - Url：   ${options.baseUrl + options.path}\n');
    buffer.write('| - Method：${options.method}\n');
    buffer.write('| - Header：${options.headers.toString()}\n');
    final data = options.data;
    if (data != null) {
      if (data is Map) {
        buffer.write('| - Body：  ${options.data.toString()}\n');
      } else if (data is FormData) {
        final formDataMap = {}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        buffer.write("| - Body：  ${formDataMap.toString()}\n");
      } else {
        buffer.write("| - Body：  ${data.toString()}\n");
      }
    }
    _appLogger.info(buffer);
    return handler.next(options);
  }
}
