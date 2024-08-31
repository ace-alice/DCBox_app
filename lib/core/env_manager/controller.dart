import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/app_logger.dart';
import '../../common/env_config.dart';
import '../../common/storage_key.dart';
import '../../network/api/get_web_url.dart';
import '../../utils/get_fast_api.dart';
import '../encrypt_manager/encrypt_manager.dart';
import 'env_manager.dart';
import 'state.dart';

class EnvManagerImpl extends GetxController implements EnvManager {
  final EncryptManager _encryptManager;

  EnvManagerImpl({required EncryptManager encryptManager})
      : _encryptManager = encryptManager;

  @override
  Future<bool> init() async {
    bool isNetWorking = await checkNetWork();
    if (!isNetWorking) {
      return false;
    }
    bool status = await setup();
    return status;
  }

  @override
  EnvState state = Get.put(EnvState());

  ///
  @override
  Future<bool> setup() async {
    if (state.apiDomain.isEmpty) {
      final apiDomain = await getFastApiDomain();
      if (apiDomain.isEmpty) {
        return false;
      }
    }
    String? aesKey = GetStorage().read(StorageKey.serviceAesKey);
    if (aesKey == null) {
      bool encryptStatus = await _encryptManager.init(state.apiDomain);
      if (!encryptStatus) {
        return false;
      }
    }
    String domain = await getFastWebDomain();
    return domain.isNotEmpty;
  }

  ///检查网络是否可用
  @override
  Future<bool> checkNetWork() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none) ||
        connectivityResult.contains(ConnectivityResult.other)) {
      state.isNetworking.value = false;
      return false;
    }
    return true;
  }

  ///获得速度最快的Api域名
  @override
  Future<String> getFastApiDomain() async {
    if (state.apiDomain.isNotEmpty) {
      return state.apiDomain;
    }
    String apiUrl = await getFastDomain(
        EnvConfig.apiDomains.map((e) => '${e}health').toList(), 'health');
    state.apiDomain = apiUrl;
    return apiUrl;
  }

  ///获得速度最快的h5域名
  @override
  Future<String> getFastWebDomain() async {
    WebUrlResponse webUrlResponse =
        await GetWebUrlHttp(deviceManager: Get.find(), langManager: Get.find())
            .request(WebUrlResData(), state.apiDomain);
    logger.d('h5DomainsResponse ${webUrlResponse.domains}');
    if (webUrlResponse.domains.isEmpty) {
      return '';
    }
    String domain = await getFastDomain(
        webUrlResponse.domains.map((e) => '$e/version.txt').toList(),
        'version.txt');
    state.webDomain.value = domain;
    return domain;
  }
}
