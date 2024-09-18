import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';

class LoginAuthHttp extends HttpManager<LoginAuthResponse, LoginAuthResData> {
  LoginAuthHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeUser/loginAuth';

  @override
  LoginAuthResponse jsonBodyDecoder(data) {
    return LoginAuthResponse.jsonDecode(data);
  }
}

class LoginAuthResponse extends AppResponse {
  final bool result;

  LoginAuthResponse({
    required this.result,
  });

  static LoginAuthResponse jsonDecode(dynamic data) {
    bool result = data ?? false;

    return LoginAuthResponse(
      result: result,
    );
  }
}

class LoginAuthResData extends BaseResData {
  final String token;
  final String securityId;

  LoginAuthResData({required this.token, required this.securityId});

  @override
  Map<String, dynamic> toMap() {
    return {
      's0': token,
      'securityId': securityId,
    };
  }
}
