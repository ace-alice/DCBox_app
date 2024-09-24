import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/biz_types.dart';
import '../../extensions/string_md5.dart';
import '../../network/api/get_verify_types.dart';
import '../../network/api/pre_login.dart';
import '../../network/models/verify_slide_model.dart';
import '../../router/app_routes.dart';
import 'state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

  final PreLoginHttp _preLoginHttp;

  final GetVerifyTypesHttp _getVerifyTypesHttp;

  LoginController(
      {required PreLoginHttp preLoginHttp,
      required GetVerifyTypesHttp getVerifyTypesHttp})
      : _preLoginHttp = preLoginHttp,
        _getVerifyTypesHttp = getVerifyTypesHttp;

  final formKey = GlobalKey<FormState>();

  submit() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with form submission
      state.sliderVerifyController.showDialog();
    }
  }

  tabChange(int index) {
    state.tabType.value = TabType.values[index];
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future preLogin(VerifySlideModel result) async {
    if (result.success) {
      try {
        state.loading.value = true;
        PreLoginResponse loginResponse = await _preLoginHttp.request(
          PreLoginResData(
            phone: state.phoneState.controller.text,
            countryCode:
                state.selectCountryCodeController.countryCode.value.code,
            email: state.emailState.controller.text,
            loginType: state.tabType.value == TabType.phone ? 1 : 2,
            password: state.passwordState.controller.text.toMd5,
            captchaVerifyId: result.captchaVerifyId,
          ),
        );
        if (loginResponse.result.token.isNotEmpty) {
          GetVerifyTypesResponse typesResponse =
              await _getVerifyTypesHttp.request(
            GetVerifyTypesResData(
              bizType: BizType.LOGIN,
              s0: loginResponse.result.token,
            ),
          );
          if (typesResponse.model.verifyTypes.isNotEmpty) {
            Get.toNamed(
              AppRoutes.verify,
              arguments: jsonEncode(
                {
                  'verifyTypes': typesResponse.model.verifyTypes,
                  'phone': state.phoneState.controller.text,
                  'countryCode':
                      state.selectCountryCodeController.countryCode.value.code,
                  'email': state.emailState.controller.text,
                  'verifyType': state.tabType.value == TabType.phone ? 1 : 2,
                  'captchaVerifyId': result.captchaVerifyId,
                  'bizType': BizType.LOGIN.name,
                  'token': loginResponse.result.token
                },
              ),
            );
          }
        }
      } catch (e) {
        rethrow;
      } finally {
        state.loading.value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    everAll([
      state.tabType,
      state.passwordState.validValue,
      state.phoneState.validValue,
      state.emailState.validValue,
    ], (resultList) {
      if (state.tabType.value == TabType.phone) {
        state.disabled.value = !state.passwordState.validValue.value ||
            !state.phoneState.validValue.value;
      }
      if (state.tabType.value == TabType.email) {
        state.disabled.value = !state.passwordState.validValue.value ||
            !state.emailState.validValue.value;
      }
    });
    ever(state.tabType, (value) {
      state.passwordState.formFieldKey.currentState!.reset();
      state.passwordState.validValue.value = false;
    });
  }
}
