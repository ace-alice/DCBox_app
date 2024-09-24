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
import 'widgets/register_app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.put(RegisterController());
  final state = Bind.find<RegisterController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar().build(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TrKey.createAnAccount.tr,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColor.brand62A2B0),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTabs(
                  height: 135,
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
                const SizedBox(height: 12),
                Row(
                  children: [
                    Obx(
                      () => Container(
                        height: 14,
                        width: 14,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Checkbox(
                          value: state.isAgree.value,
                          activeColor: AppColor.brand62A2B0,
                          onChanged: controller.checkedChange,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        children: [
                          Text(
                            TrKey.iHaveReadAndAgree.tr,
                            style: const TextStyle(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.termsOfUse);
                            },
                            child: Text(
                              TrKey.termsOfUse.tr,
                              style: const TextStyle(
                                  fontSize: 14, color: AppColor.brand62A2B0),
                            ),
                          ),
                          Text(
                            TrKey.and.tr,
                            style: const TextStyle(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.privacyPolicy);
                            },
                            child: Text(
                              TrKey.privacyPolicy.tr,
                              style: const TextStyle(
                                  fontSize: 14, color: AppColor.brand62A2B0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SliderVerifyWidget(
                  controller: state.sliderVerifyController,
                  returnResult: (VerifySlideModel result) {
                    controller.checkPhoneOrEmail(result);
                  },
                  child: SubmitButtonComponent(
                    onPressed: () {
                      controller.submit();
                    },
                    text: TrKey.next.tr,
                    disabled: state.disabled,
                    loading: state.loading,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    Text(
                      TrKey.registered.tr,
                      style: const TextStyle(color: AppColor.textFFFFFF),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Text(TrKey.toLogIn.tr,
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

  @override
  void dispose() {
    Bind.delete<RegisterController>();
    super.dispose();
  }
}

WidgetStateProperty<EdgeInsetsGeometry?> setPadding() {
  return MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>((states) {
    return const EdgeInsets.symmetric(horizontal: 0);
  });
}

WidgetStateProperty<Size?> setMinimumSize() {
  return MaterialStateProperty.resolveWith<Size?>((states) {
    return const Size(20, 15);
  });
}
