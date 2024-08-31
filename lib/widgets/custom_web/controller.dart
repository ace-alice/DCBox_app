import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'state.dart';

class CustomWebController extends GetxController {
  final CustomWebState state = CustomWebState();

  reLoad() {
    state.isLoading.value = true;
    state.webViewController.reload();
  }

  addHtmlConsole(InAppWebViewController controller) async {
    if (kDebugMode) {
      controller.evaluateJavascript(source: '''
              (function() {
                var script = document.createElement('script');
                script.src = 'https://cdn.jsdelivr.net/npm/vconsole@latest/dist/vconsole.min.js';
                document.head.appendChild(script);
                script.onload = function() {
                  var vConsole = new VConsole();
                  console.log('vConsole is enabled');
                };
              })();
            ''');
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
