import 'dart:convert';

import 'package:get/get.dart';

import '../../biometric_manager/biometric_manager.dart';
import '../../env_manager/state.dart';

Future<Object?> supportBiometricType(Object? data) async {
  EnvState envState = Get.find<EnvState>();
  final isSupportBiometric = await BiometricManager.isSupportedBiometric();
  Map<String, dynamic> typeMap = {
    'isUseBiometric': envState.isUseBiometric.value,
    'isSupportBiometric': isSupportBiometric,
    'supportBiometricType': [],
  };
  if (isSupportBiometric) {
    final type = await BiometricManager.supportBiometricType();
    typeMap['supportBiometricType'] = type.map((e) => e.name).toList();
  }
  return jsonEncode(typeMap);
}
