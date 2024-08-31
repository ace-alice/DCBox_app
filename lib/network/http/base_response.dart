import '../../common/app_logger.dart';

abstract class AppResponse {}

class EmptyResponse extends AppResponse {
  EmptyResponse();

  static EmptyResponse decode(dynamic data) => EmptyResponse();

  factory EmptyResponse.decodeFrom(dynamic json) => EmptyResponse();
}

class HeaderResponse extends AppResponse {
  final String code;
  final String message;
  final String? fieldErrs;

  HeaderResponse({
    required this.code,
    required this.message,
    required this.fieldErrs,
  });

  static HeaderResponse decode(dynamic data) {
    return HeaderResponse(
      code: data['code'],
      fieldErrs: data['fieldErrs'],
      message: data['message'],
    );
  }

  bool get isError => !isSuccess;

  bool get isSuccess => code == '0000';

  /// code: 1005, message: Token过期, 请重新登录
  ///
  /// code: 1006, message: 账号在其他设备登录
  ///
  /// code: 1010, message: 登录未授权
  bool get isTickOut =>
      code == tokenExpired ||
      code == loginAnotherDevice ||
      code == loginUnauthorized;
}

extension on HeaderResponse {
  String get tokenExpired => '1005';

  String get loginAnotherDevice => '1006';

  String get loginUnauthorized => '1010';
}

class BoolResponse extends AppResponse {
  final bool result;

  BoolResponse(this.result);

  factory BoolResponse.decode(dynamic data) {
    if (data is bool) {
      return BoolResponse(data);
    }
    if (data is int) {
      logger.d('[API] 要跟後端講, 是否確定要回傳 int 類型');
      return BoolResponse(data != 0);
    }
    logger.d('[API] 這邊有很嚴重的問題, 不是 int 也不是 bool');
    return BoolResponse(false);
  }
}
