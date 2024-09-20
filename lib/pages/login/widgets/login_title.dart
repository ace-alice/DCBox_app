import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';

Widget loginTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 8),
        child: Text(
          TrKey.loginTitle.tr,
          style: const TextStyle(fontSize: 24, color: AppColor.brand62A2B0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Container(
              height: 1,
              width: 40,
              decoration: const BoxDecoration(color: AppColor.brand62A2B0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                TrKey.loginSubTitle.tr,
                style: const TextStyle(
                    color: AppColor.brand62A2B0, fontSize: 13, height: 1.25),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
