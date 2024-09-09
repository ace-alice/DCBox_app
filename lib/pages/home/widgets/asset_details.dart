import 'package:flutter/cupertino.dart';

import '../../../common/app_color.dart';

Widget assetDetails() {
  return Container(
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.backdrop222222,
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '资产详情',
            style: TextStyle(
              fontSize: 14,
              height: 1.25,
              color: AppColor.text9A9AA0,
            ),
          ),
        ),
      ],
    ),
  );
}
