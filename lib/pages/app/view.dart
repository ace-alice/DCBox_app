import 'package:dc_box_app/pages/home/view.dart';
import 'package:dc_box_app/pages/order/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import 'controller.dart';
import 'widgets/bottom_navigation_bar.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    final state = Bind.find<AppController>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(Get.currentRoute),
        backgroundColor: AppColor.backdrop4C6D778B,
      ),
      body: Obx(() {
        return IndexedStack(
          index: state.pageIndex.value,
          children: [
            Navigator(
              key: Get.nestedKey('1')?.navigatorKey,
              initialRoute: '/home',
              onGenerateRoute: (settings) {
                return GetPageRoute(
                  settings: settings,
                  page: () => Navigator(
                    onGenerateRoute: (settings) => GetPageRoute(
                      settings: settings,
                      page: () => _getPageByRoute(settings.name!),
                    ),
                  ),
                );
              },
            ),
            Navigator(
              key: Get.nestedKey('2')?.navigatorKey,
              initialRoute: '/trade',
              onGenerateRoute: (settings) {
                return GetPageRoute(
                  settings: settings,
                  page: () => Navigator(
                    onGenerateRoute: (settings) => GetPageRoute(
                      settings: settings,
                      page: () => _getPageByRoute(settings.name!),
                    ),
                  ),
                );
              },
            ),
            Navigator(
              key: Get.nestedKey('3')?.navigatorKey,
              initialRoute: '/order',
              onGenerateRoute: (settings) {
                return GetPageRoute(
                  settings: settings,
                  page: () => Navigator(
                    onGenerateRoute: (settings) => GetPageRoute(
                      settings: settings,
                      page: () => _getPageByRoute(settings.name!),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
      bottomNavigationBar: bottomNavigationBar(controller, state),
    );
  }
}

Widget _getPageByRoute(String route) {
  switch (route) {
    case '/home':
      return const HomePage();
    case '/trade':
      return const OrderPage();
    case '/order':
      return const OrderPage();
    default:
      return const HomePage();
  }
}
