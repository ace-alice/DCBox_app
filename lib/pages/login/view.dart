import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';
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
                  height: 120,
                ),
                SubmitButtonComponent(
                  onPressed: controller.submit,
                  text: 'submit',
                  disabled: state.disabled,
                  loading: state.loading,
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
