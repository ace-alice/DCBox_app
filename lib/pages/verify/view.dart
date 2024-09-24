import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/tr_key.dart';
import '../../router/app_routes.dart';
import '../../widgets/submit_button/view.dart';
import 'controller.dart';
import 'widgets/otp_verify/view.dart';
import 'widgets/send_verify_code/view.dart';

class VerifyPage extends StatefulWidget {
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController(
        sendVerifyCodeHttp: Get.find(), verifyRequestHttp: Get.find()));

    return Scaffold(
      backgroundColor: AppColor.backdrop222222,
      appBar: AppBar(
        title: Text(TrKey.navTitleSafeVerify.tr),
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
              onPressed: () {
                controller.onPressed(context);
              },
              loading: controller.loading,
              disabled: controller.disabled,
              text: TrKey.confirm.tr,
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    Get.delete<VerifyController>(force: true);
  }
}
