import 'package:get/get.dart';

import 'state.dart';

abstract class EnvManager extends GetxController {
  late EnvState state;
  Future<bool> setup();
  Future<bool> checkNetWork();
  Future<bool> init();
  Future<String> getFastApiDomain();
  Future<String> getFastWebDomain();
}
