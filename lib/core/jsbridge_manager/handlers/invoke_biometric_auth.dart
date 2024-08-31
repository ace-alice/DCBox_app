import '../../biometric_manager/biometric_manager.dart';
import '../core/jsbridge.dart';

Future<Object?> invokeBiometricAuth(Object? data) async {
  final result = await BiometricManager.invokeBiometricAuth();
  jsBridge.callHandler('invokeBiometricAuth', data: result);
  return result;
}
