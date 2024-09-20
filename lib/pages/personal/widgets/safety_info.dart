import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';
import '../../../core/user_manager/state.dart';

class SafetyInfo extends StatelessWidget {
  SafetyInfo({super.key});

  UserState userState = Get.put(UserState());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColor.backdrop222222,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  SizedBox(
                    child: AppImage.personal.account(height: 40),
                  ),
                  const SizedBox(height: 6),
                  Text(TrKey.securityCenter.tr),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Expanded(child: SizedBox.shrink()),
                      Container(
                        height: 26,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(
                          minWidth: 95, // 设置最小宽度为 100
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(233, 67, 67, 0.5),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColor.textE94343),
                        ),
                        child: Text(
                          TrKey.mineLowIntensity.tr,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 0.5,
            height: 86,
            decoration: BoxDecoration(
              color: AppColor.border4C6D778B,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  SizedBox(
                    child: AppImage.personal.kyc(height: 40),
                  ),
                  const SizedBox(height: 6),
                  Text(TrKey.mineKYCIdentityVerification.tr),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Expanded(child: SizedBox.shrink()),
                      Container(
                          height: 26,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(
                            minWidth: 95, // 设置最小宽度为 100
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 211, 59, 0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.text00D33B),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: AppImage.personal.icUserOkay(height: 18),
                              ),
                              Text(
                                TrKey.kycFirstLevelTitle.tr,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                      const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
