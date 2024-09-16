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
                const Text(
                  '创建账号',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColor.brand62A2B0),
                ),
                const SizedBox(
                  height: 40,
                ),
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
                const SizedBox(
                  height: 40,
                ),
                SubmitButtonComponent(
                  onPressed: controller.submit,
                  text: '下一步',
                  disabled: state.disabled,
                  loading: state.loading,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      '注册过?',
                      style: TextStyle(color: AppColor.textFFFFFF),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      style: ButtonStyle(padding: setPadding()),
                      child: const Text('去登录',
                          style: TextStyle(color: AppColor.brand62A2B0)),
                    ),
                    Expanded(
                      child: Container(),
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
