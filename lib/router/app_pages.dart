import 'package:dc_box_app/pages/home/index.dart';
import 'package:dc_box_app/pages/order/index.dart';
import 'package:dc_box_app/pages/trade/index.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/storage_key.dart';
import '../middleware/request_camera_and_photos_permission.dart';
import '../pages/app/index.dart';
import '../pages/browser/index.dart';
import '../pages/guide/index.dart';
import '../pages/qia_qia_service/index.dart';
import '../pages/qr_code_scan/index.dart';
import '../pages/welcome/index.dart';
import '../widgets/mobile_scanner/binding.dart';
import 'app_routes.dart';

class AppPages {
  // 首屏路由
  static GetPage get firstPage => routes.firstWhere((element) {
        GetStorage getStorage = GetStorage();
        final hasGuide = getStorage.read(StorageKey.hasGuide);
        if (hasGuide == null) {
          return element.name == AppRoutes.guide;
        } else {
          return element.name == AppRoutes.app;
        }
      });

  // browser路由
  static GetPage get browserPage => routes.firstWhere((element) {
        return element.name == AppRoutes.browser;
      });

  // 404
  static GetPage get unknownPage =>
      routes.firstWhere((element) => element.name == AppRoutes.unknown);

  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.guide,
      page: () => const GuidePage(),
      binding: GuideBinding(),
      title: 'guide',
    ),
    GetPage(
      name: AppRoutes.unknown,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      title: 'unknown',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.app,
      page: () => const AppPage(),
      binding: AppBinding(),
      title: 'app',
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      title: 'welcome',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.browser,
      page: () => const BrowserPage(),
      binding: BrowserBinding(),
      title: 'browser',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.service,
      page: () => const QiaQiaServicePage(),
      binding: QiaQiaServiceBinding(),
      title: 'service',
      popGesture: false,
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 500),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.scan,
      page: () => const QRCodeScanPage(),
      bindings: [QRCodeScanBinding(), MobileScannerBinding()],
      title: 'scan',
      popGesture: false,
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 500),
      fullscreenDialog: true,
      middlewares: [RequestCameraAndPhotosPermission()],
    ),
  ];

  static GetPage homePage = GetPage(
    name: AppRoutes.home,
    page: () => const HomePage(),
    binding: HomeBinding(),
    title: 'home',
  );

  static GetPageRoute tradePage = GetPageRoute(
    page: () => const TradePage(),
    binding: TradeBinding(),
    title: 'trade',
  );

  static GetPageRoute orderPage = GetPageRoute(
    page: () => const OrderPage(),
    binding: OrderBinding(),
    title: 'order',
  );
}
