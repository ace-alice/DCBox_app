import '../../common/biz_types.dart';
import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/verify_request_model.dart';

class VerifyRequestHttp
    extends HttpManager<VerifyRequestResponse, VerifyRequestResData> {
  VerifyRequestHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'security/verifyRequest';

  @override
  VerifyRequestResponse jsonBodyDecoder(data) {
    return VerifyRequestResponse.jsonDecode(data);
  }
}

class VerifyRequestResponse extends AppResponse {
  final VerifyRequestModel result;

  VerifyRequestResponse({
    required this.result,
  });

  static VerifyRequestResponse jsonDecode(dynamic data) {
    VerifyRequestModel result = VerifyRequestModel.fromJson(data);

    return VerifyRequestResponse(
      result: result,
    );
  }
}

class VerifyRequestResData extends BaseResData {
  final String? biometricCode;
  final BizType bizType;
  final String? emailCode;
  final String? otpCode;
  final String? replyCode;
  final String? smsCode;
  final String? transPass;
  final String? captchaVerifyId;
  final String? token;

  VerifyRequestResData({
    this.biometricCode,
    required this.bizType,
    this.emailCode,
    this.otpCode,
    this.replyCode,
    this.smsCode,
    this.transPass,
    this.captchaVerifyId,
    this.token,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'biometricCode': biometricCode,
      'bizType': bizType.name,
      'emailCode': emailCode,
      'otpCode': otpCode,
      'replyCode': replyCode,
      'smsCode': smsCode,
      'transPass': transPass,
      'captchaVerifyId': captchaVerifyId,
      's0': token,
    };
  }
}
