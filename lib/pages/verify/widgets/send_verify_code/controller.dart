import 'package:dc_box_app/common/env_config.dart';
import 'package:dc_box_app/network/models/verify_code_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/biz_types.dart';
import '../../../../common/verify_type.dart';
import '../../../../network/api/send_verify_code.dart';
import '../../../../network/models/verify_arguments.dart';

class SendVerifyCodeController extends GetxController {
  final VerifyArguments verifyArguments;
  final SendVerifyCodeHttp http;

  final bool autoSend;

  SendVerifyCodeController({
    required this.verifyArguments,
    required this.http,
    this.autoSend = false,
  });

  Rx<int> endTime = DateTime.now().millisecondsSinceEpoch.obs;

  Rx<int> sendCount = 0.obs;

  RxString code = ''.obs;

  late VerifyCodeModel model;

  Future sendCode() async {
    try {
      SendVerifyCodeResponse response =
          await http.request(SendVerifyCodeResData(
        email: verifyArguments.email,
        phone: verifyArguments.phone,
        countryCode: verifyArguments.countryCode,
        bizType: BizTypeConfig.getTypeByName(verifyArguments.bizType),
        verifyType: VerifyTypeConfig.getTypeByIndex(verifyArguments.verifyType),
        captchaVerifyId: verifyArguments.captchaVerifyId,
        s0: verifyArguments.token,
      ));
      model = response.model;
      sendCount.value++;
      endTime.value = DateTime.now().millisecondsSinceEpoch + 1000 * 59;
      if (EnvConfig.envType == EnvType.fat) {
        textEditingController.text = response.model.code;
      }
    } catch (e) {
      rethrow;
    } finally {}
  }

  TextEditingController textEditingController = TextEditingController();

  String get title {
    return verifyArguments.verifyType == VerifyType.phone.index
        ? '手机认证'
        : '邮箱认证';
  }

  String get content {
    return verifyArguments.verifyType == VerifyType.phone.index
        ? '将发送至 +${verifyArguments.countryCode} ${verifyArguments.phone}'
        : '将发送至 ${verifyArguments.email}';
  }
}
