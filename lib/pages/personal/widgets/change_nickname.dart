import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/app_toast.dart';
import '../../../common/text_form_field_option.dart';
import '../../../common/tr_key.dart';
import '../../../core/user_manager/index.dart';
import '../../../generated/app_image/app_image.dart';
import '../../../widgets/common_pop_ups/view.dart';
import '../../../widgets/custom_text_field/view.dart';

class ChangeNicknameWidget extends StatelessWidget {
  const ChangeNicknameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AppToast.popUps(
          popUpsWidget: ChangeNicknameDialog(),
          duration: null,
        );
      },
      icon: AppImage.common.icEdit(height: 14),
    );
  }
}

class ChangeNicknameDialog extends CommonPopUpsComponent {
  UserState userState = Get.put(UserState());

  @override
  bool get showCloseBtn => userState.userInfo.value.nickName.isNotEmpty;

  @override
  String get tip {
    if (userState.userInfo.value.nickName.isNotEmpty) {
      return TrKey.titleModifyNickname.tr;
    }
    return TrKey.titleSetNickname.tr;
  }

  final formKey = GlobalKey<FormState>();

  late TextFormFieldOption nickNameState;

  ChangeNicknameDialog() {
    nickNameState = TextFormFieldOption(
      hintText: TrKey.placeholderNickname.tr,
      initialValue: userState.userInfo.value.nickName.isNotEmpty
          ? userState.userInfo.value.nickName
          : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return TrKey.placeholderNickname.tr;
        }
        return null;
      },
    );
  }

  @override
  Widget child() {
    return SizedBox(
      height: 80,
      child: Material(
        color: AppColor.backdrop222222,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Overlay(
                initialEntries: [
                  OverlayEntry(
                    canSizeOverlay: true,
                    builder: (context) => CustomTextFieldComponent(
                      textFormFieldOption: nickNameState,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  onConfirm() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
    return null;
  }
}
