import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/tr_key.dart';
import 'operation_group_item.dart';

class OperationGroup extends StatelessWidget {
  const OperationGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OperationGroupItem(
          radiusLocation: RadiusLocation.top,
          icon: AppImage.personal.mineList2(height: 16),
          text: TrKey.transferWhitelist.tr,
          onClick: () {},
        ),
        OperationGroupItem(
          icon: AppImage.personal.mineList3(height: 16),
          text: TrKey.mineAboutUs.tr,
          onClick: () {},
        ),
        OperationGroupItem(
          icon: AppImage.personal.mineList4(height: 16),
          text: TrKey.mineFAQ.tr,
          onClick: () {},
        ),
        OperationGroupItem(
          icon: AppImage.personal.mineList5(height: 16),
          text: TrKey.mineContactCustomerService.tr,
          onClick: () {},
        ),
        OperationGroupItem(
          hasBorder: false,
          radiusLocation: RadiusLocation.bottom,
          icon: AppImage.personal.icUpgrade(height: 16),
          text: TrKey.version.tr,
          onClick: () {},
        ),
      ],
    );
  }
}
