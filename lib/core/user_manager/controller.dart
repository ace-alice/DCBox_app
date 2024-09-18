import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/storage_key.dart';
import '../../core/user_manager/state.dart';
import '../../network/api/get_user_info.dart';
import 'user_manager.dart';

class UserManagerImpl implements UserManager {
  UserState userState = Get.put(UserState());

  GetUserInfoHttp _getUserInfoHttp;

  UserManagerImpl({required GetUserInfoHttp getUserInfoHttp})
      : _getUserInfoHttp = getUserInfoHttp {
    ever(userState.token, (value) {
      if (value.isNotEmpty) {
        init();
      } else {}
    });
  }

  @override
  Future init() async {
    if (userState.loading.value) {
      return;
    }
    userState.loading.value = true;
    if (userState.token.value.isNotEmpty) {
      await Future.wait([getUserInfo(), getUserBalance()]);
    }
    userState.loading.value = false;
  }

  Future getUserInfo() async {
    try {
      UserInfoResponse response =
          await _getUserInfoHttp.request(UserInfoResData());
      userState.userInfo.value = response.result;
    } catch (e) {
      rethrow;
    }
  }

  Future getUserBalance() async {}

  @override
  setToken(String? token) {
    userState.token.value = token ?? '';
    GetStorage getStorage = GetStorage();
    if (token == null || token.isEmpty) {
      getStorage.remove(StorageKey.token);
      getStorage.remove(StorageKey.tokenExpired);
    } else {
      getStorage.write(StorageKey.token, token);
      setTokenExpired();
    }
  }

  @override
  setTokenExpired() {
    userState.tokenExpired.value =
        DateTime.now().add(const Duration(minutes: 30));
    GetStorage getStorage = GetStorage();
    getStorage.write(StorageKey.tokenExpired,
        userState.tokenExpired.value.toIso8601String());
  }
}
