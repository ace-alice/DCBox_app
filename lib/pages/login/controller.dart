import 'package:dc_box_app/common/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

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
