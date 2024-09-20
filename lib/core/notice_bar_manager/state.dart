import 'package:dc_box_app/network/models/bulletin_item.dart';
import 'package:get/get.dart';

class NoticeBarState {
  RxInt currentIndex = 0.obs;

  RxBool loading = false.obs;

  RxList<BulletinItem> marqueeList =
      [].map((e) => BulletinItem.fromJson(e)).toList().obs;

  RxList<BulletinItem> dialogList =
      [].map((e) => BulletinItem.fromJson(e)).toList().obs;
}
