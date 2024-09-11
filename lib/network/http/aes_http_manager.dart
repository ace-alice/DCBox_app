import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../common/env_config.dart';
import '../../common/http_config.dart';
import '../../core/device_manager/device_manager.dart';
import '../../core/device_manager/index.dart';
import '../../core/lang_manager/index.dart';
import '../../core/lang_manager/lang_manager.dart';
import '../../exception/exception.dart';
import 'base_form_data.dart';
import 'base_res_data.dart';
import 'base_response.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';

abstract class AesHttpManager<T extends AppResponse, K extends BaseResData> {
  bool get isNotAes => true;

  final DeviceManager _deviceManager;

  final LangManager _langManager;

  AesHttpManager(
      {required DeviceManager deviceManager, required LangManager langManager})
      : _deviceManager = deviceManager,
        _langManager = langManager;

  init(String baseUrl) async {
    // 配置BaseOptions
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      //连接超时
      connectTimeout: HttpConfig.connectTimeout,
      //接收超时
      receiveTimeout: HttpConfig.receiveTimeout,
      //内容类型
      // contentType: 'application/json',
      //响应数据类型：Json
      responseType:
          EnvConfig.encryptSwitch || !isNotAes ? ResponseType.bytes : null,
      headers: {
        'qid': const Uuid().v4(),
        's1': await _deviceManager.deviceId,
        'fromType': await _deviceManager.releaseType,
        'content-type': 'application/json',
        // 'version': AppInfo().appVersion,
        'language': _langManager.lang,
      },
    );
    Dio dio = Dio(options);
    dio.interceptors.add(RequestInterceptor(isNotAes: isNotAes));
    dio.interceptors.add(ResponseInterceptor(isNotAes: isNotAes));
    dio.interceptors.add(ErrorInterceptor());
    return dio;
  }

  String get path => '';

  BaseMethod get method => BaseMethod.post;

  Future<Map<String, dynamic>> getParams() async {
    return {};
  }

  T getResBodyFromDecodeResponse(dynamic data) {
    final header = HeaderResponse.decode(data['head']);
    if (header.isError) {
      throw GKpocketException(header, data['body']);
    }
    final body = data['body'];
    if (body == null) {
      throw GKpocketException(header, data['body']);
    }
    try {
      return jsonBodyDecoder(body);
    } catch (e) {
      throw DecoderException(data, e);
    }
  }

  T jsonBodyDecoder(dynamic data);

  ///网络请求
  Future<T> request(K data, String baseUrl) async {
    try {
      final formData =
          await BaseFormData(_deviceManager, _langManager).getFormData(data);
      final params = await getParams();
      Dio dio = await init(baseUrl);
      final response = await dio.request(
        path,
        data: formData,
        queryParameters: params,
        options: Options(method: method.name),
      );
      return getResBodyFromDecodeResponse(response.data);
    } on DioException catch (e) {
      rethrow;
    }
  }
}

enum BaseMethod { get, post, put, delete, patch, head }
