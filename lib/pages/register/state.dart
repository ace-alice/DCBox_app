import 'package:dc_box_app/widgets/select_country_code/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../common/text_form_field_option.dart';

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
      labelText: '手机号码',
      hintText: '请输入手机号码',
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入手机号';
        }
        // 正则表达式用于验证手机号格式（此处以中国大陆手机号格式为例）
        String pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return '请输入有效的手机号';
        }
        return null;
      },
    );

    emailState = TextFormFieldOption(
      labelText: '邮箱',
      hintText: '请输入邮箱',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入邮箱地址';
        }
        // 正则表达式用于验证邮箱格式
        String pattern = r'^[^@]+@[^@]+\.[^@]+';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return '请输入有效的邮箱地址';
        }
        return null;
      },
    );
  }
}

enum ParameterType { phone, email, countryCode }

enum TabType { phone, email }
