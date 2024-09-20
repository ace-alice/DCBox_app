import 'package:dc_box_app/widgets/select_country_code/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/text_form_field_option.dart';
import '../../common/tr_key.dart';

class RegisterState {
  SelectCountryCodeController selectCountryCodeController =
      SelectCountryCodeController();

  late TextFormFieldOption phoneState;

  late TextFormFieldOption passwordState;

  late TextFormFieldOption emailState;

  Rx<TabType> tabType = TabType.phone.obs;

  RxBool loading = false.obs;

  RxBool disabled = true.obs;

  List<RxBool> parameterValidResult =
      ParameterType.values.map<RxBool>((p) => false.obs).toList();

  RegisterState() {
    phoneState = TextFormFieldOption(
      labelText: TrKey.phoneNumber1.tr,
      hintText: TrKey.pleaseEnterYourPhoneNumber.tr,
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
      keyboardType: TextInputType.emailAddress,
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

enum ParameterType { phone, email, countryCode }

enum TabType { phone, email }
