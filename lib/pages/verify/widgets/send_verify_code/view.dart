import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/tr_key.dart';
import 'controller.dart';

class SendVerifyCodeComponent extends StatelessWidget {
  SendVerifyCodeController controller;

  final RxBool disabled;

  Function(bool result) returnResult;

  SendVerifyCodeComponent({
    super.key,
    required this.controller,
    required this.disabled,
    required this.returnResult,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.title,
              style: const TextStyle(fontSize: 16, height: 1.25),
            ),
            Obx(
              () => CountdownTimer(
                endTime: controller.endTime.value,
                onEnd: () {},
                widgetBuilder: (_, time) {
                  if (time == null) {
                    return GestureDetector(
                      onTap: () {
                        controller.sendCode();
                      },
                      child: Text(
                        controller.sendCount.value == 0
                            ? TrKey.sendVerificationCode.tr
                            : TrKey.smsResend.tr,
                        style: const TextStyle(color: AppColor.brand62A2B0),
                      ),
                    );
                  }
                  return Text(
                    '${time.sec}${TrKey.secondsLaterResend.tr}',
                    style: const TextStyle(color: AppColor.text999999),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          controller.content,
          style: const TextStyle(
              fontSize: 14, height: 1.25, color: AppColor.brand62A2B0),
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
        )
      ],
    );
  }
}
