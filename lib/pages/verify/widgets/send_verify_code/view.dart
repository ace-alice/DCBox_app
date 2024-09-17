import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'controller.dart';

class SendVerifyCodeComponent extends StatelessWidget {
  SendVerifyCodeController controller;

  final RxBool disabled;

  SendVerifyCodeComponent(
      {super.key, required this.controller, required this.disabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          // errorAnimationController: errorController,
          // Pass it here
          onChanged: (value) {
            final RegExp numericRegex = RegExp(r'^[0-9]+$');
            bool isVail = numericRegex.hasMatch(value);
            if (isVail) {
              controller.code.value = value;
            } else {
              controller.code.value = '';
              controller.textEditingController.clear();
            }
          },
          appContext: context,
        )
      ],
    );
  }
}
