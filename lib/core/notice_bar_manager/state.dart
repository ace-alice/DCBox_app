import 'package:get/get.dart';

class NoticeBarState {
  RxInt currentIndex = 0.obs;
  RxList<NoticeItem> notices = [
    NoticeItem('这是第一条', '这是第一条'),
    NoticeItem('这是第二条', '这是第二条'),
    NoticeItem('这是第三条', '这是第三条')
  ].obs;
}

class NoticeItem {
  final String title;
  final String content;

  NoticeItem(this.title, this.content);
}
