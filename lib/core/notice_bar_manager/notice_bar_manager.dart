import 'package:flutter/cupertino.dart';

import 'state.dart';

abstract class NoticeBarManager {
  late PageController pageController;

  int get currentIndex;

  int get noticesLength;

  void toNextPage(BuildContext context);

  List<NoticeItem> get notices;
}
