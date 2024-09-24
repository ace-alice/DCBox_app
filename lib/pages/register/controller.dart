import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/app_logger.dart';
import '../../common/app_toast.dart';
import 'state.dart';

class RegisterController extends GetxController {
  RegisterState state = RegisterState();
  final formKey = GlobalKey<FormState>();

  submit() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with form submission
      AppToast.simple('submit');
    }
  }

  tabChange(int index) {
    state.tabType.value = TabType.values[index];
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void checkedChange(bool? value) {
    state.isAgree.value = value ?? false;
  }

  @override
  void onInit() {
    super.onInit();
    everAll(state.parameterValidResult, (resultList) {
      if (state.tabType.value == TabType.phone) {
        state.disabled.value =
            !state.parameterValidResult[ParameterType.phone.index].value;
      }
      if (state.tabType.value == TabType.email) {
        state.disabled.value =
            !state.parameterValidResult[ParameterType.email.index].value;
      }
      logger.w('state.disabled=>${state.disabled.value}');
    });
  }
}
