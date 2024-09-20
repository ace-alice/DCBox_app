import 'package:dc_box_app/core/user_manager/index.dart';
import 'package:dc_box_app/router/app_routes.dart';
import 'package:get/get.dart';

import '../../../network/api/login_auth.dart';
import '../controller.dart';

class LoginHandler {
  final LoginAuthHttp _loginAuthHttp;

  LoginHandler({required LoginAuthHttp loginAuthHttp})
      : _loginAuthHttp = loginAuthHttp;

  UserManager userManager = Get.find<UserManager>();
  UserState userState = Get.find<UserState>();

  Future init(String? token, String securityId) async {
    try {
      if (token == null) {
        return false;
      }
      LoginAuthResponse response = await _loginAuthHttp
          .request(LoginAuthResData(token: token, securityId: securityId));
      if (response.result) {
        userManager.setToken(token);
        Future.delayed(const Duration(seconds: 1), () {
          Get.toNamed(AppRoutes.app);
          Get.removeRoute(AppRoutes.verify);
          Get.delete<VerifyController>();
        });
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
