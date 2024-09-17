import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import 'controller.dart';
import 'widgets/send_verify_code/view.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(VerifyController(sendVerifyCodeHttp: Get.find()));

    return Scaffold(
      backgroundColor: AppColor.backdrop222222,
      appBar: AppBar(
        title: const Text('安全认证'),
        titleTextStyle:
            const TextStyle(color: AppColor.textFFFFFF, fontSize: 18),
        iconTheme: const IconThemeData(color: AppColor.textFFFFFF),
        backgroundColor: AppColor.backdrop222222,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SendVerifyCodeComponent(
              controller: controller.sendVerifyCodeController,
              disabled: controller.loading,
            ),
          ],
        ),
      ),
    );
  }
}
