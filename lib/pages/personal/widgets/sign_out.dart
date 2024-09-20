import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';
import '../../../generated/app_image/app_image.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
