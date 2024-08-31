import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../widgets/custom_web/controller.dart';
import '../../widgets/custom_web/view.dart';
import 'controller.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({super.key});

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final controller = Get.find<BrowserController>();
  final state = Bind.find<BrowserController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 243, 245, 1),
      // 设置背景色为蓝灰色
      floatingActionButtonLocation: TopRightFloatingActionButtonLocation(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: CustomWebComponent(
              initialUrl: controller.envState.webDomain.value,
              initJsbridge: (InAppWebViewController webViewController,
                  CustomWebController customWebController) {
                state.webViewController = customWebController;
                state.isInit.value = true;
                controller.initJsbridge(webViewController);
              },
            ),
          )
        ],
      ),
      // floatingActionButton: Obx(() {
      //   return state.isInit.value &&
      //           !state.webViewController!.state.isLoading.value
      //       ? FloatingActionButton.small(
      //           onPressed: () {
      //             state.webViewController!.reLoad();
      //           },
      //           backgroundColor: AppColor.textFFFFFF,
      //           autofocus: true,
      //           child: const Icon(
      //             Icons.cached_sharp,
      //             color: AppColor.other1380FF,
      //           ),
      //         )
      //       : const SizedBox.shrink();
      // }),
    );
  }

  @override
  void dispose() {
    Bind.delete<BrowserController>();
    super.dispose();
  }
}

class TopRightFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // 计算 X 和 Y 的偏移量
    double x = scaffoldGeometry.scaffoldSize.width -
        scaffoldGeometry.floatingActionButtonSize.width -
        16.0;
    double y = Get.height - 160.0;

    return Offset(x, y);
  }
}
