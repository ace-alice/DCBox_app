import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../core/jsbridge_manager/handlers/handlers.dart';
import 'core/jsbridge.dart';
import 'jsbridge_manager.dart';

class JsbridgeManagerImpl implements JsbridgeManager {
  @override
  void init(InAppWebViewController webViewController, Function register) {
    jsBridge.init(messageExecutor: (javascriptString) async {
      await webViewController.evaluateJavascript(source: javascriptString);
    });
    webViewController.addJavaScriptHandler(
        handlerName: jsBridge.channelName,
        callback: (arguments) {
          jsBridge.onMessageReceived(arguments);
        });
    register();
  }

  @override
  registerBrowser() {
    jsBridge.registerHandler('openQiaQia', openQiaQia);
    jsBridge.registerHandler('openCustomerService', openCustomerService);
    jsBridge.registerHandler('toQRCodeScanner', toQRCodeScanner);
    jsBridge.registerHandler('supportBiometricType', supportBiometricType);
    jsBridge.registerHandler('invokeBiometricAuth', invokeBiometricAuth);
    jsBridge.registerHandler('changeIsUseBiometric', changeIsUseBiometric);
  }
}
