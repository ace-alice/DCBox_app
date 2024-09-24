import 'dart:convert';

import 'package:dc_box_app/common/biz_types.dart';
import 'package:dc_box_app/network/api/send_verify_code.dart';
import 'package:dc_box_app/network/api/verify_request.dart';
import 'package:dc_box_app/pages/verify/widgets/otp_verify/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/verify_type.dart';
import '../../network/models/verify_arguments.dart';
import 'channel_by_biz.dart';
import 'widgets/send_verify_code/controller.dart';

class VerifyController extends GetxController {
  late VerifyArguments verifyArguments;

  final SendVerifyCodeHttp _sendVerifyCodeHttp;

  final VerifyRequestHttp _verifyRequestHttp;

  late SendVerifyCodeController sendVerifyCodeController;

  OtpVerifyController otpVerifyController = OtpVerifyController();

  VerifyController(
      {required SendVerifyCodeHttp sendVerifyCodeHttp,
      required VerifyRequestHttp verifyRequestHttp})
      : _sendVerifyCodeHttp = sendVerifyCodeHttp,
        _verifyRequestHttp = verifyRequestHttp {
    // 提取和反序列化参数
    final arguments = Get.arguments as String;
    final verifyArgumentsJson = jsonDecode(arguments) as Map<String, dynamic>;
    VerifyArguments verifyArgument =
        VerifyArguments.fromJson(verifyArgumentsJson);
    verifyArguments = verifyArgument;
    sendVerifyCodeController = SendVerifyCodeController(
        verifyArguments: verifyArgument, http: _sendVerifyCodeHttp);
  }

  RxBool loading = false.obs;

  RxBool disabled = true.obs;

  RxBool otpPass = false.obs;

  RxBool normalPass = false.obs;

  bool get showSendCodeCom {
    return verifyArguments.verifyTypes.contains(VerifyType.email.index) ||
        verifyArguments.verifyTypes.contains(VerifyType.phone.index);
  }

  bool get showOtpCom {
    return verifyArguments.verifyTypes.contains(VerifyType.otp.index);
  }

  onPressed(BuildContext context) async {
    try {
      loading.value = true;
      VerifyRequestResponse response = await _verifyRequestHttp.request(
        VerifyRequestResData(
          bizType: BizTypeConfig.getTypeByName(verifyArguments.bizType),
          smsCode: verifyArguments.verifyTypes.contains(VerifyType.phone.index)
              ? sendVerifyCodeController.code.value
              : null,
          emailCode:
              verifyArguments.verifyTypes.contains(VerifyType.email.index)
                  ? sendVerifyCodeController.code.value
                  : null,
          otpCode: showOtpCom ? otpVerifyController.code.value : null,
          captchaVerifyId: verifyArguments.captchaVerifyId,
          token: verifyArguments.token,
        ),
      );
      if (response.result.success) {
        channelByBiz(
          BizTypeConfig.getTypeByName(verifyArguments.bizType),
          verifyArguments.token,
          response.result.securityId,
        );
      }
    } catch (e) {
      rethrow;
    } finally {
      loading.value = false;
      sendVerifyCodeController.textEditingController.text = '';
      otpVerifyController.textEditingController.text = '';
      sendVerifyCodeController.endTime.value =
          DateTime.now().millisecondsSinceEpoch;
    }
  }

  @override
  void onInit() {
    super.onInit();
    everAll([otpPass, normalPass], (value) {
      disabled.value =
          !((!showSendCodeCom || (showSendCodeCom && normalPass.value)) &&
              (!showOtpCom || (showOtpCom && otpPass.value)));
    });
  }
}
