import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../core/summary_trans_manager/index.dart';

Widget orderVolume() {
  SummaryTransState summaryTransState = Get.put(SummaryTransState());
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
        Expanded(
          child: Column(
            children: [
              const Text(
                '24H成交量(U)',
                style: TextStyle(
                    color: AppColor.text9A9AA0, fontSize: 14, height: 1.25),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  '${summaryTransState.summaryTrans.value.tranAmount}',
                  style: const TextStyle(
                      color: AppColor.textFFFFFF, fontSize: 18, height: 1.25),
                ),
              ),
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
        Expanded(
          child: Column(
            children: [
              const Text(
                '24H成单量',
                style: TextStyle(
                    color: AppColor.text9A9AA0, fontSize: 14, height: 1.25),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  '${summaryTransState.summaryTrans.value.tranCount}',
                  style: const TextStyle(
                      color: AppColor.textFFFFFF, fontSize: 18, height: 1.25),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
