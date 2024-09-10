import 'package:flutter/cupertino.dart';

import '../../../common/app_color.dart';

Widget orderVolume() {
  return Container(
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.symmetric(vertical: 24),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.backdrop222222,
    ),
    child: Row(
      children: [
        const Expanded(
          child: Column(
            children: [
              Text(
                '24H成交量(U)',
                style: TextStyle(
                    color: AppColor.text9A9AA0, fontSize: 14, height: 1.25),
              ),
              SizedBox(height: 10),
              Text(
                'data',
                style: TextStyle(
                    color: AppColor.textFFFFFF, fontSize: 18, height: 1.25),
              )
            ],
          ),
        ),
        Container(
          width: 1,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(56, 56, 56, 1),
          ),
        ),
        const Expanded(
          child: Column(
            children: [
              Text(
                '24H成单量',
                style: TextStyle(
                    color: AppColor.text9A9AA0, fontSize: 14, height: 1.25),
              ),
              SizedBox(height: 10),
              Text(
                'data',
                style: TextStyle(
                    color: AppColor.textFFFFFF, fontSize: 18, height: 1.25),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
