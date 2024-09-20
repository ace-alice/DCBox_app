import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/tr_key.dart';
import '../../../core/notice_bar_manager/state.dart';
import '../../../generated/app_image/app_image.dart';

Widget showNoticeBar(void Function() cancelFunc) {
  NoticeBarState state = Get.put<NoticeBarState>(NoticeBarState());

  PageController pageController = PageController();

  toNextPage() {
    if (state.currentIndex.value + 1 < state.dialogList.length) {
      state.currentIndex.value++;
    } else {
      cancelFunc();
    }
  }

  ever(state.currentIndex, (value) {
    pageController.animateToPage(
      state.currentIndex.value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  });

  return Obx(
    () {
      return Container(
        height: 260,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.backdrop2D2D2D,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: state.dialogList.value.map((notice) {
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                notice.content,
                                style:
                                    const TextStyle(fontSize: 13, height: 1.25),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              onPressed: toNextPage,
                              child: Text(
                                TrKey.iKnow.tr,
                                style: const TextStyle(
                                    fontSize: 14, color: AppColor.textFFFFFF),
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
                '${state.currentIndex.value + 1}/${state.dialogList.value.length}',
                style:
                    const TextStyle(fontSize: 13, color: AppColor.text9A9AA0),
              ),
            )
          ],
        ),
      );
    },
  );
}
