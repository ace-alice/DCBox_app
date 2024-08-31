import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../core/env_manager/state.dart';
import '../../core/jsbridge_manager/jsbridge_manager.dart';
import 'state.dart';

class BrowserController extends GetxController {
  final BrowserState state = BrowserState();
  final JsbridgeManager _jsbridgeManager;
  final EnvState envState = Bind.find<EnvState>();

  BrowserController({required JsbridgeManager jsbridgeManager})
      : _jsbridgeManager = jsbridgeManager;

  initJsbridge(
    InAppWebViewController webViewController,
  ) {
    _jsbridgeManager.init(webViewController, _jsbridgeManager.registerBrowser);
  }

  void onReload(String toUrl) {
    state.webViewController?.state.webViewController.loadUrl(
        urlRequest:
            URLRequest(url: WebUri('${envState.webDomain.value}$toUrl')));
  }
}
