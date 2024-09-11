import 'package:dc_box_app/pages/app/widgets/app_bar.dart';
import 'package:dc_box_app/pages/home/index.dart';
import 'package:dc_box_app/pages/order/index.dart';
import 'package:dc_box_app/pages/trade/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/keep_alive/view.dart';
import 'controller.dart';
import 'widgets/bottom_navigation_bar.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController(countryManager: Get.find()));
    final state = Bind.find<AppController>().state;

    return Scaffold(
      appBar: appBarWidget(controller, state),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollBehavior: const ScrollBehavior(),
        children: [
          const KeepAliveWidget(
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
