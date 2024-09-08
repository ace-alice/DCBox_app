import 'dart:async';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/permission_manager/index.dart';
import '../router/app_routes.dart';

class RequestCameraAndPhotosPermission extends GetMiddleware {
  @override
  FutureOr<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    bool isHasAllPermission = await requestCameraAndPhotosPermission();
    if (!isHasAllPermission) {
      openAppSettings();
      return RouteDecoder.fromRoute(AppRoutes.browser);
    }
    return RouteDecoder.fromRoute(AppRoutes.scan);
  }
}

Future<bool> requestCameraAndPhotosPermission() async {
  PermissionManager permissionManager = Get.put(PermissionManagerImpl());
  bool result1 = await permissionManager.requestPermission(Permission.camera);
  bool result2 = await permissionManager.requestPermission(Permission.photos);
  return result1 && result2;
}
