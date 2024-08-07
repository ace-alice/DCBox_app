import 'package:dc_box_app/common/router/app_routes.dart';
import 'package:dc_box_app/pages/app/index.dart';
import 'package:dc_box_app/pages/home/index.dart';
import 'package:dc_box_app/pages/order_detail/index.dart';
import 'package:dc_box_app/pages/order_list/index.dart';
import 'package:dc_box_app/pages/trade/index.dart';
import 'package:dc_box_app/pages/unknown/index.dart';
import 'package:dc_box_app/pages/welcome/index.dart';
import 'package:get/route_manager.dart';

class AppPages {
  // 首屏路由
  GetPage get firstPage =>
      routes.firstWhere((element) => element.name == AppRoutes.welcome);

  // 404
  GetPage get unknownPage =>
      routes.firstWhere((element) => element.name == AppRoutes.unknown);

  final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      title: 'welcome',
    ),
    GetPage(
      name: AppRoutes.app,
      page: () => const AppPage(),
      binding: AppBinding(),
      title: 'app',
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      title: 'home',
    ),
    GetPage(
      name: AppRoutes.unknown,
      page: () => const UnknownPage(),
      binding: UnknownBinding(),
      title: 'unknown',
    ),
    GetPage(
      name: AppRoutes.orderDetail,
      page: () => const OrderDetailPage(),
      binding: OrderDetailBinding(),
      title: 'orderDetail',
    ),
    GetPage(
      name: AppRoutes.orderList,
      page: () => const OrderListPage(),
      binding: OrderListBinding(),
      title: 'orderList',
    ),
    GetPage(
      name: AppRoutes.trade,
      page: () => const TradePage(),
      binding: TradeBinding(),
      title: 'trade',
    ),
  ];
}
