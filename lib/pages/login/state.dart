import 'package:dc_box_app/common/biz_types.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/text_form_field_option.dart';
import '../../common/tr_key.dart';
import '../../widgets/select_country_code/controller.dart';
import '../../widgets/slider_verify/controller.dart';

class LoginState {
  SelectCountryCodeController selectCountryCodeController =
      SelectCountryCodeController();

  late TextFormFieldOption phoneState;

  late TextFormFieldOption passwordState;

  late TextFormFieldOption emailState;

  Rx<TabType> tabType = TabType.phone.obs;

  RxBool loading = false.obs;

  RxBool disabled = true.obs;

  SliderVerifyController sliderVerifyController =
      SliderVerifyController(bizType: BizType.LOGIN);

  LoginState() {
    ///Initialize variables
    passwordState = TextFormFieldOption(
      labelText: TrKey.password.tr,
      hintText: TrKey.passwordHint.tr,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return TrKey.passwordHint.tr;
        }
        return null;
      },
      isPassWord: true,
    );

    phoneState = TextFormFieldOption(
      labelText: TrKey.phoneNumber1.tr,
      hintText: TrKey.pleaseEnterYourPhoneNumber.tr,
      nextFocusNode: passwordState.focusNode,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return TrKey.pleaseEnterYourPhoneNumber.tr;
        }
        // 正则表达式用于验证手机号格式（此处以中国大陆手机号格式为例）
        String pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return TrKey.hintPhoneIncorrect.tr;
        }
        return null;
      },
    );

    emailState = TextFormFieldOption(
      labelText: TrKey.eMail.tr,
      hintText: TrKey.mailHint.tr,
      nextFocusNode: passwordState.focusNode,
      keyboardType: TextInputType.emailAddress,
      initialValue: 'gkhectortest@gmail.com',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return TrKey.mailHint.tr;
        }
        // 正则表达式用于验证邮箱格式
        String pattern = r'^[^@]+@[^@]+\.[^@]+';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return TrKey.pleaseEnterValidEmail.tr;
        }
        return null;
      },
    );
  }
}

enum ParameterType { phone, password, email, countryCode }

enum TabType { phone, email }
