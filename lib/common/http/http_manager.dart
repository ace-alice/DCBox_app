import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:uuid/uuid.dart';

import '../../common/core/device_manager/device_manager.dart';
import '../../common/core/device_manager/device_manager_impl.dart';
import '../../common/core/lang_manager/lang_manager.dart';
import '../../common/core/lang_manager/lang_manager_impl.dart';
import '../../common/env/env_config.dart';
import '../../common/http/base_form_data.dart';
import '../../common/http/base_response.dart';
import '../../common/http/interceptors/error_interceptor.dart';
import '../../common/http/interceptors/request_interceptor.dart';
import '../../common/http/interceptors/response_interceptor.dart';
import '../../common/utils/app_config.dart';
import 'base_res_data.dart';

abstract class HttpManager<T extends BaseResponse, K extends BaseResData> {
  late Dio _dio;

  final EnvConfig _envConfig = getx.Get.find<EnvConfig>();

  final DeviceManager _deviceManager = getx.Get.find<DeviceManagerImpl>();

  final LangManager _langManager = getx.Get.find<LangManagerImpl>();

  init(K data) async {
    // 配置BaseOptions
    BaseOptions options = BaseOptions(
      baseUrl: _envConfig.getBaseApiUrl,
      //连接超时
      connectTimeout: AppConfig.connectTimeout,
      //接收超时
      receiveTimeout: AppConfig.receiveTimeout,
      //内容类型
      contentType: 'application/json',
      //响应数据类型：Json
      responseType: _envConfig.encryptSwitch ? ResponseType.bytes : null,
      headers: {
        'qid': const Uuid().v4(),
        's1': await _deviceManager.deviceId,
        'fromType': await _deviceManager.releaseType,
        'content-type': 'application/json',
        // 'version': AppInfo().appVersion,
        'language': _langManager.lang,
      },
    );
    data = data;
    _dio = Dio(options);
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  String get path;

  late K data;

  BaseMethod get method => BaseMethod.post;

  Future<Map<String, dynamic>> getParams() async {
    return {};
  }

  ///网络请求
  Future<dynamic> request() async {
    try {
      Response response;
      final formData = await BaseFormData().getFormData(data);
      final params = await getParams();
      response = await _dio.request(
        path,
        data: formData,
        queryParameters: params,
        options: Options(method: method.name),
      );
      return response.data;
    } on DioException catch (e) {
      rethrow;
    }
  }
}

enum BaseMethod { get, post, put, delete, patch, head }
