import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';

class CheckPhoneOrEmailHttp
    extends HttpManager<CheckPhoneOrEmailResponse, CheckPhoneOrEmailResData> {
  CheckPhoneOrEmailHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'common/checkPhoneOrEmail';

  @override
  CheckPhoneOrEmailResponse jsonBodyDecoder(data) {
    return CheckPhoneOrEmailResponse.jsonDecode(data);
  }
}

class CheckPhoneOrEmailResponse extends AppResponse {
  final bool result;

  CheckPhoneOrEmailResponse({
    required this.result,
  });

  static CheckPhoneOrEmailResponse jsonDecode(dynamic data) {
    bool result = data ?? false;

    return CheckPhoneOrEmailResponse(
      result: result,
    );
  }
}

class CheckPhoneOrEmailResData extends BaseResData {
  final String countryCode;
  final String phone;
  final String email;
  final int verifyType;
  final bool isAgree;
  final String captchaVerifyId;

  CheckPhoneOrEmailResData({
    required this.phone,
    required this.countryCode,
    required this.isAgree,
    required this.email,
    required this.verifyType,
    required this.captchaVerifyId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'countryCode': countryCode,
      'email': email,
      'verifyType': verifyType,
      'captchaVerifyId': captchaVerifyId,
    };
  }
}
