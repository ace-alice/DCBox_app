import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/keep_alive/view.dart';
import '../home/index.dart';
import '../order/index.dart';
import '../trade/index.dart';
import 'controller.dart';
import 'widgets/app_bar.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/notice_bar.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController(
      countryManager: Get.find(),
      userState: Get.find(),
    ));
    final state = Bind.find<AppController>().state;

    Future.delayed(const Duration(milliseconds: 1), () {
      showNoticeBar(context);
    });

    return Scaffold(
      appBar: appBarWidget(controller, state),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollBehavior: const ScrollBehavior(),
        children: [
          KeepAliveWidget(
            child: HomePage(),
          ),
          Obx(() {
            return Visibility(
                visible: state.tradeHasInit.value,
                child: const KeepAliveWidget(
                  child: TradePage(),
                ));
          }),
          const KeepAliveWidget(
            child: OrderPage(),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBarWidget(controller, state),
    );
  }
}
