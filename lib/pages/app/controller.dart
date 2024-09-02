import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class AppController extends GetxController {
  final AppState state = AppState();
  PageController pageController = PageController();

  set pageIndex(int index) {
    state.pageIndex.value = index;
  }

  bottomNavigationBarOnTap(int index) async {
    if (state.bottomActive) {
      return;
    }
    state.bottomActive = true;
    if (index == 1) {
      await Future.delayed(const Duration(seconds: 1));
      state.tradeHasInit.value = true;
    }
    pageIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    state.bottomActive = false;
    if (index != 1) {
      Future.delayed(const Duration(milliseconds: 300), () {
        state.tradeHasInit.value = false;
      });
    }
  }
}
