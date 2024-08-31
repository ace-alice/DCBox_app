import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class CustomWebState {
  late InAppWebViewController webViewController;
  RxDouble progress = 0.0.obs;
  RxBool isLoading = false.obs;

  CustomWebState() {
    ///Initialize variables
  }
}
