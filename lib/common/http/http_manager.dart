import 'package:dc_box_app/common/http/interceptors/error_interceptor.dart';
import 'package:dc_box_app/common/http/interceptors/request_interceptor.dart';
import 'package:dc_box_app/common/http/interceptors/response_interceptor.dart';
import 'package:dio/dio.dart';

class HttpManager {
  static HttpManager? _instance = HttpManager._internal();

  late Dio _dio;

  static HttpManager getInstance() {
    _instance ??= HttpManager._internal();
    return _instance!;
  }

  HttpManager._internal() {
    // 配置BaseOptions
    BaseOptions options = BaseOptions(
        baseUrl: "",
        //连接超时
        connectTimeout: const Duration(seconds: 30),
        //接收超时
        receiveTimeout: const Duration(seconds: 30),
        //内容类型
        contentType: 'application/json;Charset=UTF-8',
        //响应数据类型：Json
        responseType: ResponseType.json);
    _dio = Dio(options);
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  ///网络请求
  Future<T> request<T>(
    String path, {
    BaseMethod method = BaseMethod.get,
    Map<String, dynamic>? params,
    data,
    Options? options,
  }) async {
    options ??= Options(method: method.name);
    try {
      Response response;
      response = await _dio.request(path,
          data: data, queryParameters: params, options: options);
      return response.data;
    } on DioException catch (e) {
      rethrow;
    }
  }
}

enum BaseMethod { get, post, put, delete, patch, head }
