import 'package:dc_box_app/network/api/get_user_balance.dart';
import 'package:dc_box_app/router/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/storage_key.dart';
import '../../core/user_manager/state.dart';
import '../../exception/exception.dart';
import '../../network/api/get_user_info.dart';
import '../../network/api/logout.dart';
import '../../network/models/user_balance_model.dart';
import '../../network/models/user_info_model.dart';
import '../notice_bar_manager/notice_bar_manager.dart';
import 'initValue.dart';
import 'user_manager.dart';

class UserManagerImpl implements UserManager {
  UserState userState = Get.put(UserState());

  final GetUserInfoHttp _getUserInfoHttp;

  final GetUserBalanceHttp _getUserBalanceHttp;

  final NoticeBarManager _noticeBarManager;

  final LogoutHttp _logoutHttp;

  UserManagerImpl({
    required GetUserInfoHttp getUserInfoHttp,
    required GetUserBalanceHttp getUserBalanceHttp,
    required NoticeBarManager noticeBarManager,
    required LogoutHttp logoutHttp,
  })  : _getUserInfoHttp = getUserInfoHttp,
        _getUserBalanceHttp = getUserBalanceHttp,
        _noticeBarManager = noticeBarManager,
        _logoutHttp = logoutHttp {
    ever(userState.token, (value) async {
      if (value.isNotEmpty) {
        await init();
        Future.delayed(const Duration(milliseconds: 1200), () {
          _noticeBarManager.show();
        });
      } else {}
    });
  }

  @override
  Future init() async {
    try {
      if (userState.token.value.isNotEmpty) {
        await Future.wait([getUserInfo(), getUserBalance(), getKycStatus()]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getUserInfo() async {
    try {
      if (userState.token.value.isEmpty) {
        return;
      }
      UserInfoResponse response =
          await _getUserInfoHttp.request(UserInfoResData());
      userState.userInfo.value = response.result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getUserBalance() async {
    try {
      if (userState.token.value.isEmpty || userState.balanceLoading.value) {
        return;
      }
      userState.balanceLoading.value = true;
      UserBalanceResponse response =
          await _getUserBalanceHttp.request(UserBalanceResData());
      userState.totalBalance.value = response.result;
    } catch (e) {
      rethrow;
    } finally {
      Future.delayed(const Duration(milliseconds: 1500), () {
        userState.balanceLoading.value = false;
      });
    }
  }

  @override
  Future getKycStatus() async {
    try {
      if (userState.token.value.isEmpty || userState.kycLoading.value) {
        return;
      }
      userState.kycLoading.value = true;
    } catch (e) {
      rethrow;
    } finally {
      Future.delayed(const Duration(milliseconds: 1500), () {
        userState.kycLoading.value = false;
      });
    }
  }

  @override
  setToken(String? token) {
    userState.token.value = token ?? '';
    GetStorage getStorage = GetStorage();
    if (token == null || token.isEmpty) {
      getStorage.remove(StorageKey.token);
      getStorage.remove(StorageKey.tokenExpired);
      Future.delayed(const Duration(seconds: 1), () {
        initData();
        Get.toNamed(AppRoutes.login);
      });
    } else {
      getStorage.write(StorageKey.token, token);
    }
    setTokenExpired();
  }

  @override
  setTokenExpired() {
    userState.tokenExpired.value =
        DateTime.now().add(const Duration(minutes: 30));
    GetStorage getStorage = GetStorage();
    getStorage.write(StorageKey.tokenExpired,
        userState.tokenExpired.value.toIso8601String());
  }

  @override
  checkToken() {
    int diff =
        DateTime.now().difference(userState.tokenExpired.value).inMinutes;
    if (diff > 30) {
      setToken('');
      throw GkTokenExpiredException();
    }
    setTokenExpired();
    return true;
  }

  @override
  initData() {
    userState.userInfo.value = UserInfoModel.fromJson(initUserInfoValue);
    userState.totalBalance.value = UserBalanceModel.fromJson({});
  }

  @override
  Future<bool> logout() async {
    try {
      LogoutResponse response = await _logoutHttp.request(LogoutResData());
      if (response.result) {
        setToken('');
        initData();
      }
      return response.result;
    } catch (e) {
      return false;
    }
  }
}
