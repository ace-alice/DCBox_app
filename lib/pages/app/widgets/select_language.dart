import 'package:dc_box_app/common/app_color.dart';
import 'package:dc_box_app/core/lang_manager/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/app_image/app_image.dart';

class SelectLanguageComponent extends StatelessWidget {
  SelectLanguageComponent({super.key});

  LangManager langManager = Get.put<LangManager>(LangManagerImpl());

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: AppImage.home.icLanguage(width: 25, height: 25),
      color: const Color.fromRGBO(45, 45, 45, 1),
      position: PopupMenuPosition.under,
      onSelected: langManager.changeLang,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            height: 30,
            value: LangType.zh.name,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            textStyle:
                const TextStyle(color: AppColor.textFFFFFF, fontSize: 12),
            child: Container(
              height: 30,
              width: 108,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColor.backdrop4C6D778B,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AppImage.country.ic86(width: 20),
                  ),
                  const Text(
                    '简体中文',
                    style: TextStyle(color: AppColor.textFFFFFF, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem<String>(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            value: LangType.en.name,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppImage.country.ic44(width: 20),
                ),
                const Text(
                  'English',
                  style: TextStyle(color: AppColor.textFFFFFF, fontSize: 12),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
