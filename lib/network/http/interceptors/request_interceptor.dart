import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../common/app_logger.dart';
import '../../../common/env_config.dart';
import '../../../core/encrypt_manager/encrypt_utils.dart';

class RequestInterceptor extends Interceptor {
  final bool isNotAes;

  RequestInterceptor({
    required this.isNotAes,
  });

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

    logger.d(buffer);

    if (EnvConfig.encryptSwitch && isNotAes) {
      Uint8List aesEncryptedByteBody =
          EncryptUtils.encrypt(apiBody: options.data);
      options.data = Stream.fromIterable(aesEncryptedByteBody.map((e) => [e]));
      logger.d(options.data);
    }
    return handler.next(options);
  }
}
