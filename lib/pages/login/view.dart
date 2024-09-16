import 'package:dc_box_app/widgets/slider_verify/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../network/api/get_country_list.dart';
import '../../router/app_routes.dart';
import '../../widgets/custom_tabs/view.dart';
import '../../widgets/custom_text_field/view.dart';
import '../../widgets/select_country_code/view.dart';
import '../../widgets/submit_button/view.dart';
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
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginTitle(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CustomTabs(
                    height: 140,
                    tabs: const [Text('Phone'), Text('Email')],
                    onTap: controller.tabChange,
                    tabBarViews: [
                      CustomTextFieldComponent(
                        prefixWidget: SelectCountryCodeComponent(
                          onChanged: (CountryCodeResponse countryCode) {
                            controller.state.countryCode.value = countryCode;
                          },
                        ),
                        textFormFieldOption: state.phoneState,
                      ),
                      CustomTextFieldComponent(
                        textFormFieldOption: state.emailState,
                      ),
                    ],
                  ),
                ),
                CustomTextFieldComponent(
                  textFormFieldOption: state.passwordState,
                ),
                const SizedBox(
                  height: 40,
                ),
                SliderVerifyWidget(
                  controller: state.sliderVerifyController,
                  child: SubmitButtonComponent(
                    onPressed: () {
                      state.sliderVerifyController.showDialog();
                      controller.submit();
                    },
                    text: '登录',
                    disabled: state.disabled,
                    loading: state.loading,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      '没有账号?',
                      style: TextStyle(color: AppColor.textFFFFFF),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      style: ButtonStyle(padding: setPadding()),
                      child: const Text('去注册',
                          style: TextStyle(color: AppColor.brand62A2B0)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.app);
                      },
                      style: ButtonStyle(padding: setPadding()),
                      child: const Text('忘记密码?',
                          style: TextStyle(color: AppColor.brand62A2B0)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

WidgetStateProperty<EdgeInsetsGeometry?> setPadding() {
  return MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>((states) {
    return const EdgeInsets.symmetric(horizontal: 0);
  });
}
