import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/tr_key.dart';
import '../../network/models/verify_slide_model.dart';
import '../../router/app_routes.dart';
import '../../widgets/custom_tabs/view.dart';
import '../../widgets/custom_text_field/view.dart';
import '../../widgets/select_country_code/view.dart';
import '../../widgets/slider_verify/view.dart';
import '../../widgets/submit_button/view.dart';
import 'controller.dart';
import 'widgets/login_app_bar.dart';
import 'widgets/login_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(
        preLoginHttp: Get.find(), getVerifyTypesHttp: Get.find()));
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
                    tabs: [Text(TrKey.phone.tr), Text(TrKey.mail.tr)],
                    onTap: controller.tabChange,
                    tabBarViews: [
                      CustomTextFieldComponent(
                        prefixWidget: SelectCountryCodeComponent(
                          controller: state.selectCountryCodeController,
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
                  returnResult: (VerifySlideModel result) {
                    controller.preLogin(result);
                  },
                  child: SubmitButtonComponent(
                    onPressed: () {
                      controller.submit();
                    },
                    text: TrKey.login.tr,
                    disabled: state.disabled,
                    loading: state.loading,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      TrKey.notAccount.tr,
                      style: const TextStyle(color: AppColor.textFFFFFF),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      child: Text(TrKey.register.tr,
                          style: const TextStyle(color: AppColor.brand62A2B0)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.app);
                      },
                      style: ButtonStyle(
                          padding: setPadding(), minimumSize: setMinSize()),
                      child: Text(TrKey.forgetPassword.tr,
                          style: const TextStyle(color: AppColor.brand62A2B0)),
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
    return const EdgeInsets.all(0);
  });
}

WidgetStateProperty<Size?> setMinSize() {
  return MaterialStateProperty.resolveWith<Size?>((states) {
    return const Size(20, 20);
  });
}
