import 'package:dc_box_app/common/app_toast.dart';
import 'package:get/get.dart';

import '../../pages/app/widgets/notice_bar.dart';
import 'notice_bar_manager.dart';
import 'state.dart';

class NoticeBarManagerImpl implements NoticeBarManager {
  NoticeBarState state = Get.put<NoticeBarState>(NoticeBarState());

  @override
  show() {
    AppToast.popUps(
      build: showNoticeBar,
      // align: const Alignment(0, 1),
      duration: null,
      align: AlignType.bottom,
    );
  }
}
