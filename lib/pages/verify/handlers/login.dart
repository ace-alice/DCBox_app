import 'package:dc_box_app/router/app_routes.dart';
import 'package:get/get.dart';

import '../../../core/user_manager/index.dart';
import '../../../network/api/login_auth.dart';

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
        await userManager.setToken(token);
        Get.offNamed(AppRoutes.app);
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
