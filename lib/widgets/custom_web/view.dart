import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'controller.dart';
import 'loading.dart';

class CustomWebComponent extends StatelessWidget {
  final String initialUrl;

  final Function(InAppWebViewController controller,
      CustomWebController customWebController)? initJsbridge;

  CustomWebComponent({
    required this.initialUrl,
    this.initJsbridge,
    super.key,
  });

  final customWebController = CustomWebController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: InAppWebView(
            initialSettings: InAppWebViewSettings(
              userAgent: Platform.isAndroid ? 'android_client' : 'ios_client',
            ),
            initialUrlRequest:
                URLRequest(url: WebUri.uri(Uri.parse(initialUrl))),
            onWebViewCreated: (controller) {
              customWebController.state.webViewController = controller;
              initJsbridge!(controller, customWebController);
              customWebController.state.isLoading.value = true;
            },
            onLoadStart: (controller, url) {
              customWebController.state.progress.value = 0.0;
              // customWebController.state.isLoading.value = true;
            },
            onLoadStop: (controller, url) async {
              customWebController.state.progress.value = 1.0;
              customWebController.state.isLoading.value = false;
              customWebController.addHtmlConsole(controller);
            },
            onProgressChanged: (controller, progress) {
              customWebController.state.progress.value = progress / 100;
            },
          ),
        ),
        loading(
          customWebController.state.progress,
          customWebController.state.isLoading,
        ),
      ],
    );
  }
}
