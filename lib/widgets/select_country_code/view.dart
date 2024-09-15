import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';
import 'controller.dart';
import 'widgets/choose_code_dialog/view.dart';

class SelectCountryCodeComponent extends StatelessWidget {
  final controller = SelectCountryCodeController();

  SelectCountryCodeComponent({super.key, required this.onChanged});

  final Function(CountryCodeResponse countryCode) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog.fullscreen(
              child: ChooseCodeDialogComponent(
                onChanged: (CountryCodeResponse countryCode) {
                  controller.countryCode.value = countryCode;
                  onChanged(countryCode);
                },
              ),
            );
          },
        );
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            const SizedBox(width: 12),
            Obx(() => controller.countryCode.value.getCountryByCode()),
            Expanded(
              child: Container(
                alignment: const Alignment(1, 0),
                child: Obx(() => Text('+${controller.countryCode.value.code}')),
              ),
            ),
            const SizedBox(width: 2),
            Transform.rotate(
              angle: -90 * 3.141592 / 180,
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColor.textFFFFFF,
                size: 12,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 20,
              width: 1,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(68, 68, 68, 1)),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
