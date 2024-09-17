import 'package:dc_box_app/common/biz_types.dart';
import 'package:dc_box_app/common/verify_type.dart';
import 'package:dc_box_app/network/models/verify_code_model.dart';

import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';

class SendVerifyCodeHttp
    extends HttpManager<SendVerifyCodeResponse, SendVerifyCodeResData> {
  SendVerifyCodeHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'common/sendVerifyCode';

  @override
  SendVerifyCodeResponse jsonBodyDecoder(data) {
    return SendVerifyCodeResponse.jsonDecode(data);
  }
}

class SendVerifyCodeResponse extends AppResponse {
  final VerifyCodeModel model;

  SendVerifyCodeResponse({
    required this.model,
  });

  static SendVerifyCodeResponse jsonDecode(dynamic data) {
    VerifyCodeModel model = VerifyCodeModel.fromJson(data);

    return SendVerifyCodeResponse(
      model: model,
    );
  }
}

class SendVerifyCodeResData extends BaseResData {
  final String phone;
  final String email;
  final String countryCode;
  final String? s0;
  final BizType bizType;
  final VerifyType verifyType;
  final String captchaVerifyId;

  SendVerifyCodeResData({
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.bizType,
    required this.verifyType,
    this.s0,
    required this.captchaVerifyId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'bizType': bizType.name,
      's0': s0,
      'countryCode': countryCode,
      'verifyType': verifyType.index,
      'captchaVerifyId': captchaVerifyId,
      'email': email,
      'phone': phone,
    };
  }
}
