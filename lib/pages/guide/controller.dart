import 'package:get/get.dart';

class GuideController extends GetxController {
  RxInt currentPage = 0.obs;

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  @override
  void dispose() {
    Bind.delete<GuideController>();
    super.dispose();
  }
}
