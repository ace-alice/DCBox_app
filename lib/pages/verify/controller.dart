import 'dart:convert';

import 'package:dc_box_app/network/api/send_verify_code.dart';
import 'package:get/get.dart';

import '../../network/models/verify_arguments.dart';
import 'widgets/send_verify_code/controller.dart';

class VerifyController extends GetxController {
  late VerifyArguments _verifyArguments;

  SendVerifyCodeHttp _sendVerifyCodeHttp;

  late SendVerifyCodeController sendVerifyCodeController;

  VerifyController({required SendVerifyCodeHttp sendVerifyCodeHttp})
      : _sendVerifyCodeHttp = sendVerifyCodeHttp {
    // 提取和反序列化参数
    final arguments = Get.arguments as String;
    final verifyArgumentsJson = jsonDecode(arguments) as Map<String, dynamic>;
    VerifyArguments verifyArguments =
        VerifyArguments.fromJson(verifyArgumentsJson);
    _verifyArguments = verifyArguments;
    sendVerifyCodeController =
        SendVerifyCodeController(verifyArguments: verifyArguments);
  }

  RxBool loading = false.obs;
}
