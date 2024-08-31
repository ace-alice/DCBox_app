import 'package:flutter_inappwebview/flutter_inappwebview.dart';

abstract class JsbridgeManager {
  void init(InAppWebViewController webViewController, Function register);

  registerBrowser();
}
