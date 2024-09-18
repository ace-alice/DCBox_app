import 'package:dc_box_app/router/app_routes.dart';
import 'package:dc_box_app/widgets/submit_button/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import 'controller.dart';
import 'widgets/otp_verify/view.dart';
import 'widgets/send_verify_code/view.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController(
        sendVerifyCodeHttp: Get.find(), verifyRequestHttp: Get.find()));

    return Scaffold(
      backgroundColor: AppColor.backdrop222222,
      appBar: AppBar(
        title: const Text('安全认证'),
        leading: BackButton(
          onPressed: () {
            // 同时可以保持默认的返回行为
            Navigator.pop(context);
            Get.removeRoute(AppRoutes.verify);
          },
        ),
        titleTextStyle:
            const TextStyle(color: AppColor.textFFFFFF, fontSize: 18),
        iconTheme: const IconThemeData(color: AppColor.textFFFFFF),
        backgroundColor: AppColor.backdrop222222,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 40),
            controller.showOtpCom
                ? OtpVerifyComponent(
                    controller: controller.otpVerifyController,
                    disabled: controller.loading,
                    hasLine: controller.showSendCodeCom,
                    returnResult: (result) {
                      controller.otpPass.value = result;
                    },
                  )
                : const SizedBox.shrink(),
            controller.showSendCodeCom
                ? SendVerifyCodeComponent(
                    controller: controller.sendVerifyCodeController,
                    disabled: controller.loading,
                    returnResult: (result) {
                      controller.normalPass.value = result;
                    },
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 140),
            SubmitButtonComponent(
              onPressed: controller.onPressed,
              loading: controller.loading,
              disabled: controller.disabled,
              text: '确认',
            ),
          ],
        ),
      ),
    );
  }
}
