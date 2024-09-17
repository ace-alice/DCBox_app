import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/pre_login_model.dart';

class PreLoginHttp extends HttpManager<PreLoginResponse, PreLoginResData> {
  PreLoginHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeUser/login';

  @override
  PreLoginResponse jsonBodyDecoder(data) {
    return PreLoginResponse.jsonDecode(data);
  }
}

class PreLoginResponse extends AppResponse {
  final PreLoginModel result;

  PreLoginResponse({
    required this.result,
  });

  static PreLoginResponse jsonDecode(dynamic data) {
    PreLoginModel result = PreLoginModel.fromJson(data);

    return PreLoginResponse(
      result: result,
    );
  }
}

class PreLoginResData extends BaseResData {
  final String countryCode;
  final String phone;
  final String email;
  final int loginType;
  final String password;
  final String captchaVerifyId;

  PreLoginResData({
    required this.phone,
    required this.countryCode,
    required this.email,
    required this.loginType,
    required this.password,
    required this.captchaVerifyId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'countryCode': countryCode,
      'email': email,
      'loginType': loginType,
      'password': password,
      'captchaVerifyId': captchaVerifyId,
    };
  }
}
