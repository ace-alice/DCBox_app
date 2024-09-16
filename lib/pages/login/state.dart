import 'package:dc_box_app/common/zip_types.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../common/text_form_field_option.dart';
import '../../network/api/get_country_list.dart';
import '../../widgets/slider_verify/controller.dart';

class LoginState {
  Rx<CountryCodeResponse> countryCode =
      CountryCodeResponse(name: '中国', code: '86').obs;

  late TextFormFieldOption phoneState;

  late TextFormFieldOption passwordState;

  late TextFormFieldOption emailState;

  Rx<TabType> tabType = TabType.phone.obs;

  RxBool loading = false.obs;

  RxBool disabled = true.obs;

  List<RxBool> parameterValidResult =
      ParameterType.values.map<RxBool>((p) => false.obs).toList();

  SliderVerifyController sliderVerifyController =
      SliderVerifyController(zipType: ZipType.LOGIN);

  LoginState() {
    ///Initialize variables
    passwordState = TextFormFieldOption(
      labelText: '密码',
      hintText: '请输入密码',
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入密码';
        }
        return null;
      },
      isPassWord: true,
      onFieldSubmitted: (value, result) {
        parameterValidResult[ParameterType.password.index].value = result;
      },
    );

    phoneState = TextFormFieldOption(
      labelText: '手机号码',
      hintText: '请输入手机号码',
      nextFocusNode: passwordState.focusNode,
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
      onFieldSubmitted: (value, result) {
        parameterValidResult[ParameterType.phone.index].value = result;
      },
    );

    emailState = TextFormFieldOption(
      labelText: '邮箱',
      hintText: '请输入邮箱',
      nextFocusNode: passwordState.focusNode,
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
      onFieldSubmitted: (value, result) {
        parameterValidResult[ParameterType.email.index].value = result;
      },
    );
  }
}

enum ParameterType { phone, password, email, countryCode }

enum TabType { phone, email }
