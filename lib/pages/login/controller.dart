import 'package:dc_box_app/common/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

  final formKey = GlobalKey<FormState>();

  submit() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with form submission
      AppToast.simple('submit', () {});
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
        state.disabled.value = !resultList[ParameterType.phone.index] ||
            !resultList[ParameterType.password.index];
      }
      if (state.tabType.value == TabType.email) {
        state.disabled.value = !resultList[ParameterType.email.index] ||
            !resultList[ParameterType.password.index];
      }
    });
    ever(state.tabType, (value) {
      state.passwordState.formFieldKey.currentState!.reset();
    });
  }
}
