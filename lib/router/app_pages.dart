import 'package:dc_box_app/pages/privacy_policy/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/country_manager/setup.dart';
import '../core/user_manager/index.dart';
import '../middleware/request_camera_and_photos_permission.dart';
import '../pages/app/index.dart';
import '../pages/browser/index.dart';
import '../pages/login/index.dart';
import '../pages/personal/index.dart';
import '../pages/qia_qia_service/index.dart';
import '../pages/qr_code_scan/index.dart';
import '../pages/register/index.dart';
import '../pages/terms_of_use/view.dart';
import '../pages/verify/index.dart';
import '../pages/welcome/index.dart';
import '../widgets/mobile_scanner/binding.dart';
import 'app_routes.dart';

class AppPages {
  // 首屏路由
  static GetPage get firstPage => routes.firstWhere((element) {
        return element.name == AppRoutes.welcome;
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
      name: AppRoutes.unknown,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      title: 'unknown',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      bindings: [LoginBinding()],
      title: 'login',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.verify,
      page: () => VerifyPage(),
      bindings: [UserManagerBinding(), VerifyBinding()],
      title: 'verify',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      bindings: [RegisterBinding()],
      title: 'register',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.termsOfUse,
      page: () => const TermsOfUsePage(),
      title: 'termsOfUse',
      popGesture: false,
      // customTransition: CustomPageTransition(),
      transitionDuration: const Duration(microseconds: 500),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.privacyPolicy,
      page: () => const PrivacyPolicyPage(),
      title: 'privacyPolicy',
      popGesture: false,
      // customTransition: CustomPageTransition(),
      transitionDuration: const Duration(microseconds: 500),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.personal,
      page: () => const PersonalPage(),
      bindings: [UserManagerBinding(), PersonalBinding()],
      title: 'personal',
      popGesture: false,
    ),
    GetPage(
      name: AppRoutes.app,
      page: () => const AppPage(),
      bindings: [UserManagerBinding(), CountryManagerBinding(), AppBinding()],
      title: 'app',
      popGesture: false,
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
}

// 自定义过渡动画类
class CustomPageTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 定义从左到右的滑动动画
    var slideTransition = SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0), // 页面从左侧进入
        end: Offset.zero, // 最终停留在中心
      ).animate(CurvedAnimation(
        parent: animation,
        curve: curve ?? Curves.easeInOut, // 使用缓动曲线
      )),
      child: child,
    );

    // 定义淡入淡出的动画
    var fadeTransition = FadeTransition(
      opacity: animation,
      child: slideTransition, // 同时使用滑动和淡入淡出的效果
    );

    return fadeTransition;
  }
}
