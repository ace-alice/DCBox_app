import 'package:flutter/cupertino.dart';

import '../../../common/app_color.dart';

Widget loginTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 18, bottom: 8),
        child: Text(
          '登录DCBox',
          style: TextStyle(fontSize: 24, color: AppColor.brand62A2B0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Container(
              height: 1,
              width: 60,
              decoration: const BoxDecoration(color: AppColor.brand62A2B0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '爱不释手的数字币钱包',
                style: TextStyle(
                    color: AppColor.brand62A2B0, fontSize: 13, height: 1.25),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
