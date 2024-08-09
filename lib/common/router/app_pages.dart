import 'package:get/route_manager.dart';

import '../../common/router/app_routes.dart';
import '../../pages/app/index.dart';
import '../../pages/home/index.dart';
import '../../pages/order_detail/index.dart';
import '../../pages/order_list/index.dart';
import '../../pages/trade/index.dart';
import '../../pages/unknown/index.dart';
import '../../pages/welcome/index.dart';

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
