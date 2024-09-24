import 'package:dc_box_app/network/models/user_balance_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/storage_key.dart';
import '../../network/models/user_info_model.dart';
import 'initValue.dart';

class UserState {
  RxString token = ''.obs;

  Rx<DateTime> tokenExpired =
      DateTime.now().add(const Duration(minutes: 32)).obs;

  RxBool balanceLoading = false.obs;

  RxBool kycLoading = false.obs;

  Rx<UserBalanceModel> totalBalance = UserBalanceModel.fromJson({}).obs;

  String get balanceByUSDT {
    if (token.value.isEmpty) {
      return '--';
    }
    return '${totalBalance.value.balanceByUSDT}';
  }

  String get balanceByCNY {
    if (token.value.isEmpty) {
      return '--';
    }
    return '≈ ¥ ${totalBalance.value.balanceByCNY}';
  }

  Rx<UserInfoModel> userInfo = UserInfoModel.fromJson(initUserInfoValue).obs;

  UserState() {
    /// init
    GetStorage getStorage = GetStorage();

    token.value = getStorage.read(StorageKey.token) ?? '';

    if (getStorage.read(StorageKey.tokenExpired) != null) {
      tokenExpired.value =
          DateTime.parse(getStorage.read(StorageKey.tokenExpired));
    }
  }
}
