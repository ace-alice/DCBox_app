import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../network/models/verify_slide_model.dart';
import 'state.dart';

class RegisterController extends GetxController {
  RegisterState state = RegisterState();
  final formKey = GlobalKey<FormState>();

  submit() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with form submission
      state.sliderVerifyController.showDialog();
    }
  }

  Future checkPhoneOrEmail(VerifySlideModel result) async {}

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
    everAll([
      state.tabType,
      state.phoneState.validValue,
      state.emailState.validValue,
    ], (resultList) {
      if (state.tabType.value == TabType.phone) {
        state.disabled.value = !state.phoneState.validValue.value;
      }
      if (state.tabType.value == TabType.email) {
        state.disabled.value = !state.emailState.validValue.value;
      }
    });
  }
}
