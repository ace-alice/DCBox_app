import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../core/user_manager/state.dart';
import '../../../generated/app_image/app_image.dart';

class NickContent extends StatelessWidget {
  NickContent({super.key});

  UserState userState = Get.put(UserState());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.backdrop222222,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          AppImage.common.icUserAvatar(height: 38),
          const SizedBox(width: 6),
          Text(
            userState.userInfo.value.nickName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 5),
          Text(
            '(${userState.userInfo.value.loginName})',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          IconButton(
            onPressed: () {},
            icon: AppImage.common.copy(height: 14),
          ),
          IconButton(
            onPressed: () {},
            icon: AppImage.common.icEdit(height: 14),
          )
        ],
      ),
    );
  }
}
