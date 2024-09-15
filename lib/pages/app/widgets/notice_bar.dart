import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/notice_bar_manager/index.dart';
import '../../../generated/app_image/app_image.dart';

showNoticeBar(BuildContext pContext) {
  NoticeBarManager noticeBarManager = Get.put(NoticeBarManagerImpl());
  showModalBottomSheet(
    context: pContext,
    backgroundColor: AppColor.backdrop222222,
    useSafeArea: true,
    enableDrag: false,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    constraints: BoxConstraints.tight(Size(375.w, 250)),
    builder: (BuildContext context) {
      return Obx(
        () {
          return SizedBox(
            // height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: PageView(
                  controller: noticeBarManager.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: noticeBarManager.notices.map((notice) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppImage.home.icSpeaker(width: 16),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  notice.title,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    notice.content,
                                    style: const TextStyle(
                                        fontSize: 13, height: 1.25),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(98, 162, 176, 1),
                                      Color.fromRGBO(145, 201, 214, 1),
                                    ], // 渐变颜色
                                    begin: Alignment.topLeft, // 渐变的起点
                                    end: Alignment.bottomRight, // 渐变的终点
                                  ),
                                  borderRadius: BorderRadius.circular(20), // 圆角
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 1),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent, // 去掉阴影
                                  ),
                                  onPressed: () {
                                    noticeBarManager.toNextPage(pContext);
                                  },
                                  child: const Text(
                                    '我知道了',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textFFFFFF),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    '${noticeBarManager.currentIndex}/${noticeBarManager.noticesLength}',
                    style: const TextStyle(
                        fontSize: 13, color: AppColor.text9A9AA0),
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}
