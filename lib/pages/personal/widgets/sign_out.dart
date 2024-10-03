import 'package:dc_box_app/core/user_manager/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/app_toast.dart';
import '../../../common/tr_key.dart';
import '../../../generated/app_image/app_image.dart';
import '../../../widgets/common_pop_ups/view.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppToast.popUps(popUpsWidget: SignOutDialog(), duration: null);
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Ink(
        height: 64,
        // alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 14),
        decoration: BoxDecoration(
          color: AppColor.backdrop222222,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            AppImage.personal.logout(height: 18),
            const SizedBox(width: 7),
            Text(
              TrKey.mineLogout.tr,
              style: const TextStyle(fontSize: 14),
            ),
            const Expanded(child: SizedBox.shrink()),
            const Icon(
              Icons.chevron_right_sharp,
              color: AppColor.textFFFFFF,
            ),
          ],
        ),
      ),
    );
  }
}

class SignOutDialog extends CommonPopUpsComponent {
  UserManager userManager = Get.find<UserManager>();

  @override
  onConfirm() async {
    try {
      loading.value = true;
      bool result = await userManager.logout();
      if (!result) {
        return '退出登录失败';
      }
    } catch (e) {
      rethrow;
    } finally {
      loading.value = false;
    }
    return null;
  }

  @override
  Widget child() {
    return Text(TrKey.sureToLogout.tr);
  }
}
