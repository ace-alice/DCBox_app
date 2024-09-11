import 'package:dc_box_app/common/app_logger.dart';
import 'package:flutter/cupertino.dart';

class AppRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    logger.d(
        'Pushed route: ${route.settings.name}; Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    logger.d(
        'Popped route: ${route.settings.name}; Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    logger.d(
        'Removed route: ${route.settings.name}; Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    logger.d(
        'Replaced route: ${newRoute?.settings.name}; Old route: ${oldRoute?.settings.name}');
  }
}
