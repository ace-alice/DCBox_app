import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../common/env/env_config.dart';
import '../../common/http/interceptors/error_interceptor.dart';
import '../../common/http/interceptors/request_interceptor.dart';
import '../../common/http/interceptors/response_interceptor.dart';
import '../../common/utils/app_config.dart';

abstract class HttpManager {
  late Dio _dio;

  final EnvConfig _envConfig = getx.Get.find<EnvConfig>();

  init() {
    // 配置BaseOptions
    BaseOptions options = BaseOptions(
        baseUrl: _envConfig.getBaseApiUrl,
        //连接超时
        connectTimeout: AppConfig.connectTimeout,
        //接收超时
        receiveTimeout: AppConfig.receiveTimeout,
        //内容类型
        contentType: 'application/json;Charset=UTF-8',
        //响应数据类型：Json
        responseType: ResponseType.json);
    _dio = Dio(options);
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  String get path;

  BaseMethod get method => BaseMethod.post;

  Future<dynamic> getFormData();

  Future<Map<String, dynamic>> getParams();

  ///网络请求
  Future<T> request<T>() async {
    try {
      Response response;
      final formData = await getFormData();
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
