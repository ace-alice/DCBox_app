import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../network/models/verify_arguments.dart';

class SendVerifyCodeController extends GetxController {
  final VerifyArguments _verifyArguments;

  SendVerifyCodeController({required verifyArguments})
      : _verifyArguments = verifyArguments;

  RxString code = ''.obs;

  TextEditingController textEditingController = TextEditingController();
}
