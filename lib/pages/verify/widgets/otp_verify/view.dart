import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/app_color.dart';
import '../../../../common/tr_key.dart';
import 'controller.dart';

class OtpVerifyComponent extends StatelessWidget {
  final OtpVerifyController controller;

  final RxBool disabled;

  final Function(bool result) returnResult;

  final bool hasLine;

  OtpVerifyComponent({
    super.key,
    required this.controller,
    required this.disabled,
    required this.returnResult,
    this.hasLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TrKey.navTitleGoogleVerify.tr,
          style: const TextStyle(fontSize: 16, height: 1.25),
        ),
        const SizedBox(height: 16),
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
          keyboardType: TextInputType.number,
          errorTextMargin: const EdgeInsets.only(top: 12),
          autovalidateMode: AutovalidateMode.disabled,
          controller: controller.textEditingController,
          enabled: !disabled.value,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            fieldHeight: 44,
            fieldWidth: 44,
            inactiveColor: AppColor.text9A9AA0,
            activeColor: AppColor.brand62A2B0,
            errorBorderColor: AppColor.textE94343,
            activeFillColor: AppColor.textE94343,
          ),
          onChanged: (value) {
            final RegExp numericRegex = RegExp(r'^[0-9]+$');
            bool isVail = numericRegex.hasMatch(value);
            if (isVail) {
              controller.code.value = value;
            } else {
              controller.code.value = '';
              controller.textEditingController.clear();
            }
            if (controller.textEditingController.text.length == 6) {
              returnResult(true);
            } else {
              returnResult(false);
            }
          },
          appContext: context,
        ),
        hasLine
            ? Container(
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration:
                    const BoxDecoration(color: AppColor.backdrop4C6D778B),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
