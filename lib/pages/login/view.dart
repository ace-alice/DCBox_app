import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text_field/view.dart';
import 'controller.dart';
import 'widgets/login_app_bar.dart';
import 'widgets/login_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final state = Bind.find<LoginController>().state;

    return Scaffold(
      appBar: loginAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loginTitle(),
              CustomTextFieldComponent(
                labelText: '手机号码',
                hintText: '请输入手机号码',
                isPassWord: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
