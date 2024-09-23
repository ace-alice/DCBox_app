import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';
import '../../../core/notice_bar_manager/state.dart';
import '../../../generated/app_image/app_image.dart';
import '../../../widgets/custom_marquee/view.dart';

class MarqueeCom extends StatelessWidget {
  NoticeBarState noticeState = Get.put<NoticeBarState>(NoticeBarState());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 18,
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: AppImage.home.icSpeaker(width: 16, height: 16),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              flex: 1,
              child: Obx(() {
                return CustomMarqueeComponent(
                  textStyle: const TextStyle(fontSize: 12),
                  texts: noticeState.marqueeList.value
                      .map((notice) => notice.content)
                      .toList(),
                );
              }),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      TrKey.more.tr,
                      style: const TextStyle(color: AppColor.brand62A2B0),
                    ),
                    const SizedBox(width: 4),
                    AppImage.home.icMore(height: 14, width: 14)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
