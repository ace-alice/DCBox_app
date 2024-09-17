import 'dart:convert';

import 'package:dc_box_app/common/app_logger.dart';
import 'package:dc_box_app/common/biz_types.dart';
import 'package:dc_box_app/extensions/string_md5.dart';
import 'package:dc_box_app/network/api/pre_login.dart';
import 'package:dc_box_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/api/get_verify_types.dart';
import '../../network/models/verify_slide_model.dart';
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
  }

  Future preLogin(VerifySlideModel result) async {
    if (result.success) {
      try {
        state.loading.value = true;
        PreLoginResponse loginResponse = await _preLoginHttp.request(
          PreLoginResData(
            phone: state.phoneState.controller.text,
            countryCode: state.countryCode.value.code,
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
                  'countryCode': state.countryCode.value.code,
                  'email': state.emailState.controller.text,
                  'verifyType': state.tabType.value == TabType.phone ? 1 : 2,
                  'captchaVerifyId': result.captchaVerifyId,
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
    everAll(state.parameterValidResult, (resultList) {
      if (state.tabType.value == TabType.phone) {
        state.disabled.value =
            !state.parameterValidResult[ParameterType.phone.index].value ||
                !state.parameterValidResult[ParameterType.password.index].value;
      }
      if (state.tabType.value == TabType.email) {
        state.disabled.value =
            !state.parameterValidResult[ParameterType.email.index].value ||
                !state.parameterValidResult[ParameterType.password.index].value;
      }
      logger.w('state.disabled=>${state.disabled.value}');
    });
    ever(state.tabType, (value) {
      state.passwordState.formFieldKey.currentState!.reset();
    });
  }
}
