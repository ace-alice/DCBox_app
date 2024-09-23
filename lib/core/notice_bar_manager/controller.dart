import 'package:dc_box_app/common/app_toast.dart';
import 'package:dc_box_app/network/api/get_bulletins.dart';
import 'package:get/get.dart';

import '../../pages/app/widgets/notice_bar.dart';
import '../lang_manager/lang_manager.dart';
import 'notice_bar_manager.dart';
import 'state.dart';

class NoticeBarManagerImpl implements NoticeBarManager {
  NoticeBarState state = Get.put<NoticeBarState>(NoticeBarState());

  final GetBulletinsHttp _getBulletinsHttp;

  final LangManager _langManager;

  NoticeBarManagerImpl({
    required GetBulletinsHttp getBulletinsHttp,
    required LangManager langManager,
  })  : _getBulletinsHttp = getBulletinsHttp,
        _langManager = langManager {
    ever(_langManager.langType, (value) {
      init();
    });
    Future.delayed(const Duration(seconds: 1), () {
      init();
    });
  }

  Future getBulletinList({required BulletinType bulletinType}) async {
    try {
      state.loading.value = true;
      BulletinsResponse response =
          await _getBulletinsHttp.request(BulletinsResData(type: bulletinType));
      if (bulletinType == BulletinType.dialog) {
        state.dialogList.value = response.bulletinList;
      } else {
        state.marqueeList.value = response.bulletinList;
      }
    } catch (e) {
      rethrow;
    } finally {
      state.loading.value = false;
    }
  }

  @override
  Future init() async {
    try {
      await Future.wait([
        getBulletinList(bulletinType: BulletinType.marquee),
        getBulletinList(bulletinType: BulletinType.dialog),
      ]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  show() {
    AppToast.popUps(
      popUpsWidget: ShowNoticeBarWidget(),
      // align: const Alignment(0, 1),
      duration: null,
      align: AlignType.bottom,
    );
  }
}
