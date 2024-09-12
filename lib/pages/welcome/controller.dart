import 'package:dc_box_app/core/currency_list_manager/currency_list_manager.dart';
import 'package:dc_box_app/core/summary_trans_manager/index.dart';
import 'package:get/get.dart';

import '../../core/env_manager/env_manager.dart';
import '../../core/permission_manager/permission_manager.dart';
import '../../router/app_routes.dart';
import 'state.dart';

class WelcomeController extends GetxController {
  final EnvManager _envManager;
  final PermissionManager _permissionManager;

  final SummaryTransManager _summaryTransManager;

  final CurrencyListManager _currencyListManager;

  WelcomeController(
      {required EnvManager envManager,
      required PermissionManager permissionManager,
      required SummaryTransManager summaryTransManager,
      required CurrencyListManager currencyListManager})
      : _envManager = envManager,
        _permissionManager = permissionManager,
        _summaryTransManager = summaryTransManager,
        _currencyListManager = currencyListManager;

  final WelcomeState state = WelcomeState();

  Future getApiDomain() async {
    bool status = await _envManager.init();
    // await Future.wait(
    //     [_summaryTransManager.init(), _currencyListManager.init()]);
    _summaryTransManager.init();
    _currencyListManager.init();
    if (status) {
      state.loadingStatus.value = LoadStatus.success;
    } else {
      state.loadingStatus.value = LoadStatus.fail;
    }
  }

  @override
  void onReady() async {
    super.onReady();
    ever(state.loadingStatus, (value) {
      if (value == LoadStatus.success) {
        Get.toNamed(AppRoutes.app);
      }
    });
    await getApiDomain();
  }
}
