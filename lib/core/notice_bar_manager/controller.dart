import 'package:flutter/cupertino.dart';

import 'notice_bar_manager.dart';
import 'state.dart';

class NoticeBarManagerImpl implements NoticeBarManager {
  NoticeBarState state = NoticeBarState();

  @override
  PageController pageController = PageController();

  @override
  int get currentIndex => state.currentIndex.value + 1;

  @override
  int get noticesLength => state.notices.length;

  @override
  toNextPage(BuildContext context) {
    if (currentIndex < noticesLength) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      state.currentIndex.value++;
    } else {
      Navigator.pop(context);
    }
  }

  @override
  List<NoticeItem> get notices => state.notices.value;
}
