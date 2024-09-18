import 'dart:convert';

import 'package:dc_box_app/network/api/send_verify_code.dart';
import 'package:dc_box_app/pages/verify/widgets/otp_verify/controller.dart';
import 'package:get/get.dart';

import '../../common/verify_type.dart';
import '../../network/models/verify_arguments.dart';
import 'widgets/send_verify_code/controller.dart';

class VerifyController extends GetxController {
  late VerifyArguments verifyArguments;

  final SendVerifyCodeHttp _sendVerifyCodeHttp;

  late SendVerifyCodeController sendVerifyCodeController;

  OtpVerifyController otpVerifyController = OtpVerifyController();

  VerifyController({required SendVerifyCodeHttp sendVerifyCodeHttp})
      : _sendVerifyCodeHttp = sendVerifyCodeHttp {
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
