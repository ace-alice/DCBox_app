import 'package:dc_box_app/common/app_color.dart';
import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../network/api/get_country_list.dart';
import '../../../custom_text_field/view.dart';
import 'controller.dart';

class ChooseCodeDialogComponent extends StatelessWidget {
  final controller = ChooseCodeDialogController();

  final Function(CountryCodeResponse countryCode) onChanged;

  ChooseCodeDialogComponent({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColor.backdrop121212,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.textFFFFFF),
          backgroundColor: AppColor.backdrop121212,
          title: const Text('选择国家和地区'),
          titleTextStyle:
              const TextStyle(fontSize: 18, color: AppColor.textFFFFFF),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomTextFieldComponent(
                hintText: '搜索',
                prefixWidget: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 6),
                  child: AppImage.common.search(width: 14),
                ),
                onChanged: (text) {
                  controller.searchText.value = text;
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Obx(() {
                  return Column(
                    children: controller.searchList.map((item) {
                      return InkWell(
                        onTap: () {
                          onChanged(item);
                          Navigator.of(context).pop();
                        },
                        child: Ink(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  item.getCountryByCode(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              )),
                              Text(
                                '+${item.code}',
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
