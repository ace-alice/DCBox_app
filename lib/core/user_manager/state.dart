import 'package:dc_box_app/common/storage_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserState {
  RxString token = ''.obs;

  Rx<DateTime> tokenExpired =
      DateTime.now().add(const Duration(minutes: 30)).obs;

  RxBool loading = false.obs;

  Rx<TotalBalance> totalBalance =
      TotalBalance(balanceByCNY: 140.0, balanceByUSDT: 20.0).obs;

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

class TotalBalance {
  final double balanceByCNY;
  final double balanceByUSDT;

  TotalBalance({required this.balanceByCNY, required this.balanceByUSDT});

  String get cny {
    return '≈ ¥ $balanceByCNY';
  }

  String get usdt {
    return '$balanceByUSDT';
  }
}
