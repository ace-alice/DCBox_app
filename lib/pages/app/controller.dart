import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class AppController extends GetxController {
  final AppState state = AppState();
  PageController pageController = PageController();

  set pageIndex(int index) {
    state.pageIndex.value = index;
  }

  bottomNavigationBarOnTap(int index) {
    pageIndex = index;
    Get.toNamed(state.routes[index], id: (index + 1).toString());
  }
}
