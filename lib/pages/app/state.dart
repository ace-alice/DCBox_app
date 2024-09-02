import 'package:get/get.dart';

class AppState {
  RxInt pageIndex = 0.obs;

  RxBool tradeHasInit = false.obs;

  bool bottomActive = false;

  get pageTitle {
    switch (pageIndex.value) {
      case 0:
        return '首页';
      case 1:
        return '交易';
      case 2:
        return '订单';
      default:
        return '交易';
    }
  }

  AppState() {
    ///Initialize variables
  }
}
